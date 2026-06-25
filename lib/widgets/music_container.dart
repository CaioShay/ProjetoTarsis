import 'package:flutter/material.dart';
import 'package:projeto/domain/audioPlayerHandler.dart';
import 'package:projeto/domain/Music.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicContainer extends StatelessWidget {
  late Music music;
  late double width;
  late double height;
  MusicContainer({super.key, required this.music, required this.width,required this.height});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 3,
        color: Color.fromRGBO(100,100,100,.8),
        shadowColor: Color.fromRGBO(50,0,170,1),
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        music.image_url,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: FloatingActionButton(
                        onPressed: (){},
                        backgroundColor: Colors.green,
                        child: Icon(Icons.play_arrow,color: Colors.white,),
                      ),
                    )
                  ],
                )
              ),
              Text(music.titulo,style: TextStyle(
                color: Colors.white,
                fontSize: 17
              ),)
            ],
          ),
        )
      ),
    );
  }
}