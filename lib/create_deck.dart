import 'package:flutter/material.dart';

class CreateDeck extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: fab(),
    );
  }
}

AppBar appBar(){
  return AppBar(
    title: Text('Criar baralho',style: TextStyle(color:Colors.white)),
    backgroundColor: Color(0xFF202020),
    leading: ibVoltar(),
  );
}

IconButton ibVoltar(){
  return IconButton(
    onPressed: (){}, 
    icon: Icon(
      Icons.arrow_back,
      color: Colors.white,
      )
    );
}

Column body(){
  return Column(
    children: [
      TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          labelText: 'Digite algo',
          border: OutlineInputBorder(),
        ),
      )
    ],
  );
}

FloatingActionButton fab(){
  return FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.check),
    );
}