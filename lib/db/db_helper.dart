import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'mydb.db';
    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE HISTORICO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_musica TEXT NOT NULL
    );''';

    await db.execute(sql);

    sql = '''INSERT INTO HISTORICO (id_musica) VALUES ('54d46c91-9ed5-6620-8f1e-b4ee264bc228');''';

    await db.execute(sql);
  }
}
