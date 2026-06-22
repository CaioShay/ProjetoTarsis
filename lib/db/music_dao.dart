import 'dart:async';
import 'package:projeto/domain/Music.dart';
import 'package:sqflite/sqflite.dart';
import './db_helper.dart';

class MusicDao {
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
    
    var listResult = await db.rawQuery('SELECT m.* FROM HISTORICO h JOIN MUSIC m ON h.id_musica = m.id ORDER BY h.id DESC');

    for (var json in listResult){
      Music music = Music.fromJson(json);
      musics.add(music);
    }

    return musics;
  }

  Future<List<Music>> pesquisar(String text) async{
    Database db = await DBHelper().initDB();
    List<Music> musics = [];
    
    var listResult = await db.rawQuery('Select * FROM MUSIC WHERE titulo LIKE ?;',['%$text%']);

    for (var json in listResult){
      Music music = Music.fromJson(json);
      musics.add(music);
    }

    return musics;
  }
}