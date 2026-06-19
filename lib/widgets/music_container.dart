import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto/domain/Music.dart';

class MusicContainer extends StatelessWidget {
  final Music music;

  const MusicContainer({super.key, required this.music});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(music.image),
              ),
              FloatingActionButton(
                onPressed: ()=>{},
                backgroundColor: Colors.green,
                child: Icon(Icons.play_arrow,color: Colors.white,),
              )

            ],
          ),

          SizedBox(height: 20),

          Text(music.titulo)
        ],
      ),
    );
  }
}