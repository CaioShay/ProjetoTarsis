import 'package:flutter/material.dart';
import 'package:projeto/domain/audioPlayerHandler.dart';
import 'package:projeto/domain/Music.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicContainer extends StatelessWidget {
  late Music music;

  MusicContainer({super.key, required this.music});

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
           Stack(
             children: [
               ClipRRect(
                 borderRadius: BorderRadiusGeometry.circular(20),
                 child: Image.network(music.image_url),
               ),
               Positioned(
                 right: 0,
                 bottom: 0,
                 child: FloatingActionButton(
                   onPressed: (){},
                   backgroundColor: Colors.green,
                   child: Icon(
                       Icons.play_arrow,
                     color: Colors.white,

                   ),
                 ),
               )
             ],
           ),
            SizedBox(height: 20),
            Text(music.titulo,style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}