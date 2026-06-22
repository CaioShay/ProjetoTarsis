import 'package:flutter/material.dart';
import 'package:projeto/domain/audioPlayerHandler.dart';
import 'package:projeto/domain/music.dart';
import 'package:audioplayers/audioplayers.dart';

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
                child: Image.network(music.image_url),
              ),
              FloatingActionButton(
                onPressed: ()=>{
                  
                  AudioPlayerHandler.audioPlayer.play(AssetSource(music.audio_path))
                },
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