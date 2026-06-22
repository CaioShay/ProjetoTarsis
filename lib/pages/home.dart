import 'package:flutter/material.dart';
import 'package:projeto/widgets/music_container.dart';
import '../db/music_dao.dart';
import '../domain/music.dart';

MusicsDao music_dao = MusicsDao();

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage>{
  List<Music> musicas_mais_populares = [];
  List<Music> continuar_ouvindo = [];
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async{
    musicas_mais_populares = await MusicsDao().getMaisReproduzidas();
    continuar_ouvindo = await MusicsDao().getHistorico();

    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build (BuildContext context){
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: listView_music(musicas_mais_populares),
        ),
        SizedBox(
          height: 200,
          child: listView_music(continuar_ouvindo),
        )
      ],

      
      );
  }
}

Widget listView_music(List<Music> musics){
  return ListView.builder(
    itemCount: musics.length,
    itemBuilder: (conxtet,i){
      return MusicContainer(music: musics[i]);
    },
  );
}