import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'mydb';
    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE MUSIC (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT NOT NULL ,
      audio TEXT NOT NULL,
      image TEXT,
    );''';

    await db.execute(sql);

    //Adcionando BAD de Michael Jackson
    sql =
        '''INSERT INTO MUSIC (titulo,image,audioi) VALUES(
        'Bad',
        'https://upload.wikimedia.org/wikipedia/pt/5/51/Michael_Jackson_-_Bad.png',
        'ADRESS');
    ''';

    await db.execute(sql);
  }
}
