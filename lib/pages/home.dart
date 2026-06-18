import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage>{
  @override

  Widget build (BuildContext context){
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(itemBuilder: (context,i){
            ScrollDirection: Axis.horizontal;
            return Container(child: Center(child: Text('Neymar'),),);
          }),
        )
      ],
      );
  }
}