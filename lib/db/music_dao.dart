import 'dart:async';
import 'package:projeto/db/api_handler.dart';
import 'package:projeto/domain/Music.dart';
import 'package:sqflite/sqflite.dart';
import './db_helper.dart';

class MusicDao {
  ApiHandler apiHandler = ApiHandler();
  // Future<List<Music>> getMaisReproduzidas() async{
  //   Database db = await DBHelper().initDB();
  //   List<Music> musics = [];
  //
  //   var listResult = await db.rawQuery('SELECT * FROM MUSIC ORDER BY reproducoes DESC LIMIT 10;');
  //
  //   for (var json in listResult){
  //     Music music = Music.fromJson(json);
  //     musics.add(music);
  //   }

  // return musics;
  // }

  Future<List<Music>> getHistorico() async{
    Database db = await DBHelper().initDB();
    List<Music> musics = [];

    var listResult = await db.rawQuery('SELECT * FROM HISTORICO ORDER BY HISTORICO.id DESC');

    for (var json in listResult){
      print(json.values);
      Music music = await apiHandler.getById(json['id_musica'].toString());
      musics.add(music);
    }

    return musics;
  }

  Future<List<Music>> pesquisar(String text) async{
    Database db = await DBHelper().initDB();
    List<Music> musics = [];

    var listResult = await db.rawQuery('Select * FROM MUSIC WHERE titulo LIKE ?;',['$text%']);

    for (var json in listResult){
      print(json['id_musica']);
      Music music = await apiHandler.getById(json['id_musica'].toString());
      musics.add(music);
    }

    return musics;
  }
}