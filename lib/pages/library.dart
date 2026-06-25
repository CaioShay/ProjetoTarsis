import 'package:flutter/material.dart';
import 'package:projeto/widgets/music_container.dart';
import 'package:projeto/domain/Music.dart';
import 'package:projeto/db/music_dao.dart';

class Library extends StatefulWidget{
  const Library({super.key});

  @override
  State<Library> createState()=> _StateLibrary();
}

class _StateLibrary extends State<Library>{
  
  List<Music> musics = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async{
    musics = await MusicDao().getMaisReproduzidas();
    setState(() {});
  }
  @override
  Widget build(BuildContext context){
    return GridView.builder(
      itemCount: musics.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemBuilder: (context,i){
          return MusicContainer(music: musics[i], width: 400, height: 400);
        });
  }

}