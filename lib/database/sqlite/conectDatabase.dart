
import 'package:housebarber/database/sqlite/scripts/enumDatabase.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(),
          'banco.db'); 
      _database = await openDatabase(
        path, // informando o caminho
        version: 1, // versão
        onCreate: (db, v) async {
          await db.execute("CREATE TABLE person(id INTEGER PRIMARY KEY,name VARCHAR(100),telefone VARCHAR(100),imgUrl VARCHAR(100),cpfCpnj VARCHAR(100),cep VARCHAR(100))");
          insercoes.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}
