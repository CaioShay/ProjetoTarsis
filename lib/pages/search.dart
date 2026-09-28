import 'package:flutter/material.dart';
import 'package:projeto/db/api_handler.dart';
import 'package:projeto/domain/Music.dart';
import 'package:projeto/db/music_dao.dart';
import 'package:projeto/widgets/music_card.dart';

class Search extends StatefulWidget{
  const Search({super.key});

  @override
  State<Search> createState()=> _StateSearch();
}

class _StateSearch extends State<Search>{
  TextEditingController controller = TextEditingController();
  Future<List<Music>> searched_musics = ApiHandler().search('');

  @override
  void initState(){
    super.initState();

    controller.addListener(on_searched);
  }

  void on_searched() async{
    String text = controller.text;

    searched_musics = ApiHandler().search(text);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        SizedBox(height: 10,)
        ,SearchBar(
        leading: Icon(Icons.search),
        hintText: 'Pesquisar',
        controller: controller,
      ),
        FutureBuilder(future: searched_musics, builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }

          if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          final musics = snapshot.data ?? <Music>[];

          if (musics.isEmpty){
            return Text('Music not found');
          }

          return Text('foi');
        })
      ],
    );
  }
}