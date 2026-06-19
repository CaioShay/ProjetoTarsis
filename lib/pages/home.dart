import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto/widgets/music_container.dart';
import '../db/music_dao.dart';
import '../domain/Music.dart';

MusicsDao music_dao = MusicsDao();

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage>{
  List<Music> musics = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async{
    musics = await MusicsDao().getMusics();
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build (BuildContext context){
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: mais_populares(musics),
        )
      ],
      );
  }
}

Widget mais_populares(List<Music> musics){
  return ListView.builder(
    itemCount: musics.length,
    itemBuilder: (conxtet,i){
      return MusicContainer(music: musics[i]);
    },
  );
}