import 'package:housebarber/database/sqlite/scripts/Insert.dart';
import 'package:housebarber/database/sqlite/scripts/TableCreate.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(), 'banco.db');
      deleteDatabase(path);
      _database = await openDatabase(
        path, // informando o caminho
        version: 1, // versão
        onCreate: (db, v) async {
          await createTables(db);
          await insertCommand(db);
        },
      );
      _fechado = false;
    }
    return _database;
  }

  static Future<void> createTables(Database db) async {
    for (var entry in tableSqlMap.entries) {
      await db.execute(entry.value);
    }
  }

  static Future<void> insertCommand(Database db) async {
    for (String servico in servicoInserts) {
      await db.execute(servico);
    }
    for (String cliente in clienteInserts) {
      await db.execute(cliente);
    }
    for (String produto in produtoInserts) {
      await db.execute(produto);
    }
  }
}
