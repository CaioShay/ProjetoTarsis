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
    title:Text('Estudar',style: TextStyle(color: Colors.white),),
    backgroundColor: Color(0xFF202020),
    leading: voltarButton(context),
  );
}

IconButton voltarButton(BuildContext context){
  return IconButton(
    onPressed: (){
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

SizedBox downBar() {
  return SizedBox(
    height: 100,
    width: 100,
    child: ElevatedButton(
      onPressed:(){},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        )
      ),
      child: Text('Mostrar reposta')),

  );
}
