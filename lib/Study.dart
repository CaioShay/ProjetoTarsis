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
     icon: Icon(Icons.arrow_back,color:Colors.white),
     ) ;
}

Column body(){
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),

      Center(child: Text('Quantos Continentes existe?'),),

      SizedBox(
        height: 10,
      ),

      Divider(
        indent: 20,
        endIndent: 20,
      )
    ],
  );
}

SizedBox downBar(){
  return SizedBox(
    height: 80,
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder(),
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
      ),
      child: Text('Mostrar resposta'),
    ),
  );
}