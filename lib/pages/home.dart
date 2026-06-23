import 'package:flutter/material.dart';
import 'package:projeto/widgets/music_container.dart';
import '../db/music_dao.dart';
import '../domain/Music.dart';

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
    musicas_mais_populares = await MusicDao().getMaisReproduzidas();
    continuar_ouvindo = await MusicDao().getHistorico();

    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build (BuildContext context){
    return ListView(

      children: [
        Text('Continuar ouvindo',style: TextStyle(fontSize: 30),),
        SizedBox(
          height:200,
          child: listView_music(continuar_ouvindo),
        ),
        SizedBox(height: 50,),
        Text('Músicas mais populares',style: TextStyle(fontSize: 30),),
        SizedBox(
          height: 200,
          child: listView_music(musicas_mais_populares),
        )
      ],

      );
  }
}

Widget listView_music(List<Music> musics){
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: musics.length,
    itemBuilder: (context,i){
      return Row(
        children: [
          MusicContainer(music: musics[i],width: 200,height: 200,),
          SizedBox(width: 10,)
        ],
      );
    },
  );
}