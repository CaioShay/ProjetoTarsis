import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper { 
  initDB() async{
    String path = await getDatabasesPath();
    String dbName = 'mydb';
    String dbPath = join(path,dbName);

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreateDB,
      );
    return db;
  }
  
  FutureOr<void> onCreateDB(Database db, int version) {
    String sql = '''CREATE TABLE MUSICS (
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      TITULO TEXT NOT NULL ,
      CAMINHO TEXT NOT NULL
    
    )''';

    db.execute(sql);

    sql = '''
    ''';
  }
}