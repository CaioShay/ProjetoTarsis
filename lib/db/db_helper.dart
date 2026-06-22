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
    String sql = '''CREATE TABLE MUSIC (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT NOT NULL,
      audio_path TEXT NOT NULL,
      image_url TEXT,
      reproducoes INTEGER NOt NULL
    );''';

    await db.execute(sql);

    //Adcionando BAD de Michael Jackson
    sql =
        '''INSERT INTO MUSIC (titulo,image_url,audio_path,reproducoes) VALUES(
        'Bad',
        'https://upload.wikimedia.org/wikipedia/pt/5/51/Michael_Jackson_-_Bad.png',
        'audio/Bad.mp3',
        1000000
        );
    ''';

    await db.execute(sql);

    sql = '''CREATE TABLE HISTORICO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_musica INTEGER NOT NULL,
      FOREIGN KEY (id_musica) REFERENCES MUSIC(id)
    );''';

    await db.execute(sql);

    sql = '''INSERT INTO HISTORICO (id_musica) VALUES (1);''';

    await db.execute(sql);
  }
}
