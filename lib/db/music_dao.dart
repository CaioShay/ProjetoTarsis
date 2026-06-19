import 'dart:async';
import 'package:projeto/domain/Music.dart';
import 'package:sqflite/sqflite.dart';

import './db_helper.dart';

class MusicsDao {
  Database db = DBHelper().initDB();

  FutureOr<List<Music>> getMusics() async{
    List<Music> musics = [];
    
    var listResult = await db.rawQuery('SELECT * FROM MUSIC;');

    for (var json in listResult){
      Music music = Music.fromJson(json);
      musics.add(music);
    }

    return musics;
  }

}