import 'package:flutter/material.dart';
import 'package:projeto/widgets/music_container.dart';
import 'package:projeto/db/music_dao.dart';
import 'package:projeto/domain/music.dart';

MusicsDao music_dao = MusicsDao();

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage>{
  List<Music> continuar_ouvindo = [];
  List<Music> musicas_mais_populares = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async{
    print('Loading data!');
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
          child: listView_musicas(continuar_ouvindo),
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: 200,
          child: listView_musicas(musicas_mais_populares),
        )
      ],
      );
  }
}

Widget listView_musicas(List<Music> musics){
  return ListView.builder(
    itemCount: musics.length,
    itemBuilder: (conxtet,i){
      print(i);
      return MusicContainer(music: musics[i]);
    },
  );
}