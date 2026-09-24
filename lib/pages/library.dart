import 'package:flutter/material.dart';
import 'package:projeto/db/user_dao.dart';
import 'package:projeto/widgets/music_card.dart';
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(future: MusicDao().getHistorico(), builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
      }
      if (snapshot.hasError){
        return CircularProgressIndicator();
      }

      final musics = snapshot.data ?? const <Music>[];

      if (musics.isEmpty){
        return Text('No musics found');
      }

      return GridView.builder(
          itemCount: musics.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3
      ),
          itemBuilder: (context,index){
            return MusicCard(music: musics[index], width: 1000, height: 1000,);
      });
    });;
  }
}