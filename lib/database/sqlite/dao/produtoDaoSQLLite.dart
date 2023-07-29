import 'package:housebarber/database/Models/produto.dart';
import 'package:housebarber/database/genericDao.dart';
import 'package:housebarber/database/sqlite/conectDatabase.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDaoSQLite implements GenericDao<Produto> {
  @override
  Future<bool> excluir(int id) async {
    Database db = await Conexao.criar();
    int count = await db.rawDelete('DELETE FROM produto WHERE id = ?', [id]);
    return count > 0;
  }

  @override
  Future<Produto> getById(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.rawQuery('SELECT * FROM produto WHERE id = ?', [id]);
    if (maps.length > 0) {
      return converterProduto(maps.first);
    }
    return converterProduto(maps.single);
  }

  @override
  Future<List<Produto>> listarTodos() async {
    Database db = await Conexao.criar();
    List<Produto> lista =
        (await db.query('produto')).map<Produto>(converterProduto).toList();
    return lista;
  }

  @override
  Future<Produto> salvar(Produto produto) async {
    Database db = await Conexao.criar();
    String sql;

    if (produto.id == null) {
      sql =
          'INSERT INTO produto(descricao, marca, preco, quantidade, nome, servico_id) VALUES(?, ?, ?, ?, ?, ?)';
      int id = await db.rawInsert(sql, [
        produto.descricao,
        produto.marca,
        produto.preco,
        produto.quantidade,
        produto.nome,
        produto.servico_id
      ]);
      produto = Produto(
          id: id,
          descricao: produto.descricao,
          marca: produto.marca,
          preco: produto.preco,
          quantidade: produto.quantidade,
          nome: produto.nome,
          servico_id: produto.servico_id);
    } else {
      sql =
          'UPDATE produto SET descricao = ?, marca = ?, preco = ?, quantidade = ?, nome = ?, servico_id = ? WHERE id = ?';
      await db.rawUpdate(sql, [
        produto.descricao,
        produto.marca,
        produto.preco,
        produto.quantidade,
        produto.nome,
        produto.servico_id,
        produto.id
      ]);
    }
    return produto;
  }

  Future<List<Produto>> findProdutoByServico(int servicoId) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.rawQuery("""SELECT *
        FROM produto
        INNER JOIN produto_servico ON produto_servico.produto_id = produto.id
        INNER JOIN servico ON servico.id = ?;""", [servicoId]);

    List<Produto> produtos = maps.map<Produto>(converterProduto).toList();

    return produtos;
  }

  Future<void> salvarServicoProduto(int servicoId, int produtoId) async {
    try {
      Database db = await Conexao.criar();
      List<Map<String, dynamic>> resultado = await db.rawQuery('''
      SELECT * FROM produto_servico
      WHERE servico_id = ? AND produto_id = ?''');
      print("passou");
      if (resultado.isNotEmpty) {
        await db.rawUpdate('''
        UPDATE produto_servico
        SET produto_id = ?
        WHERE servico_id = ?
      ''', [produtoId, servicoId]);
        print("atualizado");
      } else {
        await db.rawInsert('''
        INSERT INTO produto_servico (servico_id, produto_id)
        VALUES (?, ?)
      ''', [servicoId, produtoId]);
        print("inserido");
      }
    } catch (e) {
      print(e);
    }
  }

  Produto converterProduto(Map<dynamic, dynamic> produto) {
    return Produto(
        id: produto['id'],
        descricao: produto['descricao'],
        marca: produto['marca'],
        preco: produto['preco'],
        quantidade: produto['quantidade'],
        nome: produto['nome'],
        servico_id: produto['servico_id']);
  }
}
