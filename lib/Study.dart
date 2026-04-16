import 'package:flutter/material.dart';

class Study extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: body(),
        bottomNavigationBar:downBar(),
    );
  }
}

AppBar appBar(BuildContext context){
  return AppBar(
    title:Text('Estudar'),
    backgroundColor: Colors.blue,
    leading: voltarButton(context),
  );
}

IconButton voltarButton(BuildContext context){
  return IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
     icon: Icon(Icons.arrow_back),
     ) ;
}

Column body(){
  return Column(
    children: [
      Center(child: Text('Quantos Continentes existe?'),)
    ],
  );
}

Container downBar(){
  return Container(
    height: 70,

    decoration: BoxDecoration(
      color: Colors.blue
    ),

    child: ElevatedButton(
      onPressed: (){

      }, 

      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder()
      ),

      child: Text('Mostrar resposta')
      ),
  );
}