import 'package:housebarber/database/Models/produto.dart';
import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/genericDao.dart';
import 'package:housebarber/database/sqlite/conectDatabase.dart';
import 'package:sqflite/sqflite.dart';

class ServicoDaoSQLite implements GenericDao<Servico> {
  @override
  Future<bool> excluir(int id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM servico WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Servico> getById(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('servico', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return converterServico(resultado);
  }

  Future<List<Servico>> listarServicosCliente(int id) async {
    Database db = await Conexao.criar();
    List<Map> resultados = await db.rawQuery('''
    SELECT Servicos.id, Servicos.nome, Servicos.descricao, Servicos.preco 
    FROM Servicos
    JOIN Clientes_Servicos ON Servicos.id = Clientes_Servicos.servico_id
    WHERE Clientes_Servicos.cliente_id = ?;
    ''', [id]);

    return resultados.map<Servico>(converterServico).toList();
  }

  @override
  Future<List<Servico>> listarTodos() async {
    Database db = await Conexao.criar();
    List<Servico> lista =
        (await db.query('servico')).map<Servico>(converterServico).toList();
    return lista;
  }

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

  Future<List<Servico>> listarServicosPorClienteId(int clienteId) async {
    Database _db = await Conexao.criar();
    final List<Map<String, dynamic>> resultados = await _db.rawQuery('''
      SELECT * FROM servico WHERE cliente_id = ? 
    ''', [clienteId]);

    return resultados.map((resultado) => converterServico(resultado)).toList();
  }

  Servico converterServico(Map<dynamic, dynamic> resultado) {
    print(resultado);

    return Servico(
      id: resultado['id'],
      nome: resultado['nome'],
      descricao: resultado['descricao'],
      preco: resultado['preco'],
      cliente_id: resultado['cliente_id'],
    );
  }
}
