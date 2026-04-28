import 'package:flutter/material.dart';

class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: fab(),
    );
  }
}

FloatingActionButton fab(){
  return FloatingActionButton(
      onPressed: (){},
      backgroundColor: Colors.blue,
      child: Icon(Icons.check),
    );

}
AppBar appBar(){
  return AppBar(
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    title: Text('my flashcard app',style: TextStyle(color: Colors.white),),
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,)),
  );
}

Column body(){
  return Column(
    children: [
      SizedBox(
        width: 20,
      ),

      Row(children: [
        SizedBox(
          width: 20,
        ),

        Text('baralho2'),

        SizedBox(
          width: 20,
        ),

        IconButton(
          onPressed:(){}, 
          icon: Icon(Icons.more_vert),
          )
      ],),

      Divider(
        indent: 20,
        endIndent: 20,
      ),

      Row(children: [
        SizedBox(
          width: 20,
        ),

        Text('baralho2'),

        SizedBox(
          width: 20,
        ),

        IconButton(
          onPressed:(){}, 
          icon: Icon(Icons.more_vert),
          )
      ],)
    ],
  );
}
