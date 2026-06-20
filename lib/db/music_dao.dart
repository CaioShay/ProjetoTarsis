import 'dart:async';
import 'package:projeto/domain/Historico.dart';
import 'package:projeto/domain/Music.dart';
import 'package:sqflite/sqflite.dart';

import './db_helper.dart';

class MusicsDao {
  Future<List<Music>> getMusics() async{
    Database db = await DBHelper().initDB();
    List<Music> musics = [];
    
    var listResult = await db.rawQuery('SELECT * FROM MUSIC;');

    for (var json in listResult){
      Music music = Music.fromJson(json);
      musics.add(music);
    }

    return musics;
  }

  Future<List<Music>> getMaisReproduzidas() async{
    Database db = await DBHelper().initDB();
    List<Music> musics = [];
    
    var listResult = await db.rawQuery('SELECT * FROM MUSIC ORDER BY reproducoes DESC LIMIT 10;');

    for (var json in listResult){
      Music music = Music.fromJson(json);
      musics.add(music);
    }

    return musics;
  }

  Future<List<Music>> getHistorico() async{
    Database db = await DBHelper().initDB();
    List<Music> musics = [];
    
    var listResult = await db.rawQuery('SELECT * FROM HISTORICO ORDER BY id DESC');
    List<int> id_list = [];

    for (var json in listResult){
      Historico historico = Historico.fromJson(json);
      id_list.add(historico.id_musica);
    }

    return musics;
  }
}