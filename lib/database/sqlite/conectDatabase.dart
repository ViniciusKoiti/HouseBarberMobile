import 'package:housebarber/database/sqlite/scripts/enumDatabase.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(), 'banco.db');
      _database = await openDatabase(
        path, // informando o caminho
        version: 1, // versão
        onCreate: (db, v) async {
          await createTables(db);
          insercoes.forEach(db.execute);
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
}
