import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/genericDao.dart';
import 'package:housebarber/database/sqlite/conectDatabase.dart';
import 'package:sqflite/sqflite.dart';

class ClienteDaoSQLite implements GenericDao<Cliente> {
  @override
  Future<bool> excluir(int id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM cliente WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Cliente> getById(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('cliente', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return converterCliente(resultado);
  }

  @override
  Future<List<Cliente>> listarTodos() async {
    Database db = await Conexao.criar();
    List<Cliente> lista =
        (await db.query('cliente')).map<Cliente>(converterCliente).toList();
    return lista;
  }

  @override
  Future<Cliente> salvar(Cliente cliente) async {
    Database db = await Conexao.criar();
    String sql;
    if (cliente.id == null) {
      sql = 'INSERT INTO cliente(nome, telefone,email,imgUrl) VALUES (?,?,?,?)';
      int id = await db.rawInsert(
          sql, [cliente.nome, cliente.telefone, cliente.cep, cliente.imgUrl]);
      cliente = Cliente(
        id: id,
        nome: cliente.nome,
        telefone: cliente.telefone,
        avaliacoes: [],
        servicos: [],
        cpfCpnj: '',
        imgUrl: cliente.imgUrl,
        cep: cliente.cep,
      );
    } else {
      sql =
          'UPDATE cliente SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql, [
        cliente.nome,
        cliente.telefone,
        cliente.cep,
        cliente.imgUrl,
        cliente.id
      ]);
    }
    return cliente;
  }

  Cliente converterCliente(Map<dynamic, dynamic> resultado) {
    return Cliente(
      id: resultado['id'],
      nome: resultado['name'],
      telefone: resultado['telefone'],
      imgUrl: resultado['imgUrl'],
      cpfCpnj: resultado['cpfCpnj'],
      cep: resultado['cep'],
      servicos: [], // Você pode adicionar a lógica para converter os servicos do cliente também
      avaliacoes: [], // Você pode adicionar a lógica para converter as avaliacoes do cliente também
    );
  }
}
