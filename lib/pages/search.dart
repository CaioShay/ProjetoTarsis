import 'package:flutter/material.dart';
import 'package:projeto/domain/Music.dart';
import 'package:projeto/db/music_dao.dart';
import 'package:projeto/widgets/music_container.dart';

class Search extends StatefulWidget{
  const Search({super.key});

  @override
  State<Search> createState()=> _StateSearch();
}

class _StateSearch extends State<Search>{
  TextEditingController controller = TextEditingController();
  List<Music> searched_musics = [];
  
  @override
  void initState(){
    super.initState();

    controller.addListener(on_searched);
  }

  void on_searched() async{
    String text = controller.text;

    searched_musics = await MusicDao().pesquisar(text);
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
        Expanded(
          child: ListView.builder(
            itemCount: searched_musics.length,
            itemBuilder: (context,i){
              return MusicContainer(music: searched_musics[i],width: 500,height: 500,);
            },
          ),
        )
      ],
    );
  }
}