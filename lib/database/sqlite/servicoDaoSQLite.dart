import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/genericDao.dart';
import 'package:housebarber/database/sqlite/conectDatabase.dart';
import 'package:sqflite/sqflite.dart';

class ServicoDao implements GenericDao<Servico> {
  final Database _db;

  ServicoDao(this._db);

  @override
  Future<Servico> salvar(Servico servico) async {
    Database db = await Conexao.criar();
    String sql;
    if (servico.id == null) {
      sql =
          'INSERT INTO servico(nome, descricao, preco, cliente_id) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql, [
        servico.nome,
        servico.descricao,
        servico.preco,
        servico.cliente
            .id, // Assuming you have a Cliente object with an id property
      ]);
      servico = Servico(
        id: id,
        nome: servico.nome,
        descricao: servico.descricao,
        preco: servico.preco,
        cliente: servico.cliente,
      );
    } else {
      sql =
          'UPDATE servico SET nome = ?, descricao = ?, preco = ?, cliente_id = ? WHERE id = ?';
      db.rawUpdate(sql, [
        servico.nome,
        servico.descricao,
        servico.preco,
        servico.cliente
            .id, // Assuming you have a Cliente object with an id property
        servico.id,
      ]);
    }
    return servico;
  }

  @override
  Future<List<Servico>> listarTodos() async {
    final List<Map<String, dynamic>> resultados = await _db.query('servico');
    return resultados.map((resultado) => converterServico(resultado)).toList();
  }

  @override
  Future<Servico> getById(int id) async {
    final List<Map<String, dynamic>> resultados = await _db.query(
      'servico',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (resultados.isNotEmpty) {
      return converterServico(resultados.first);
    }
    throw Exception('Servico não encontrado');
  }

  @override
  Future<bool> excluir(int id) async {
    final linhasAfetadas = await _db.delete(
      'servico',
      where: 'id = ?',
      whereArgs: [id],
    );
    return linhasAfetadas > 0;
  }

  Future<List<Servico>> listarServicosPorClienteId(int clienteId) async {
    final List<Map<String, dynamic>> resultados = await _db.rawQuery('''
      SELECT * FROM servico WHERE cliente_id = ?
    ''', [clienteId]);

    return resultados.map((resultado) => converterServico(resultado)).toList();
  }

  Servico converterServico(Map<String, dynamic> resultado) {
    return Servico(
      id: resultado['id'],
      nome: resultado['nome'],
      descricao: resultado['descricao'],
      preco: resultado['preco'],
      cliente: resultado['cliente'],
    );
  }
}
