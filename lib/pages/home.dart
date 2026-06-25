import 'package:flutter/material.dart';
import 'package:projeto/widgets/music_card.dart';
import 'package:projeto/db/music_dao.dart';
import 'package:projeto/domain/Music.dart';
import 'package:google_fonts/google_fonts.dart';

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

    setState(() {});
  }

  @override
  Widget build (BuildContext context){
    return ListView(

      children: [
        Text('Continuar ouvindo',style: GoogleFonts.nunito(
          fontSize: 20
        )),
        SizedBox(
          height:200,
          child: listView_music(continuar_ouvindo),
        ),
        SizedBox(height: 50,),
        Text('Músicas mais populares',style: GoogleFonts.nunito(fontSize: 20),),
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
          MusicCard(music: musics[i],width: 200,height: 200,),
          SizedBox(width: 10,)
        ],
      );
    },
  );
}