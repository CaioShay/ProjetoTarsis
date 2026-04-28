import 'package:flutter/material.dart';
final TextEditingController controller1 = TextEditingController();
final TextEditingController controller2 = TextEditingController();

class Edit_Flashcard extends StatelessWidget{
  final TextEditingController controler1 = TextEditingController();

  @override 
  Widget build(BuildContext context){

    return Scaffold(
        appBar: appBar(context),
        floatingActionButton: fabSalvar(),
        body: body()
      );
  }
}

AppBar appBar(BuildContext context){
  return AppBar(
    title: Text('Editar Flashcard',style: TextStyle(color:Colors.white)),
    backgroundColor: Color(0xFF202020),
    leading: ibVoltar(context),
  );
}

IconButton ibVoltar(BuildContext context){
  return IconButton(
    onPressed: (){
    },

    icon: Icon(Icons.arrow_back,
      color: Colors.white,
    ),
  );
}

FloatingActionButton fabSalvar(){
  return FloatingActionButton(
    onPressed: (){},
    backgroundColor: Colors.blue,
    child: Icon(Icons.check,color: Colors.white,),
    );
}

Column body(){
  return Column(
    children: [
      Text('Pergunta'),
      textField(controller1),

      SizedBox(
        height: 10,
      ),

      Divider(
          indent: 20,
          endIndent: 20,
      ),

      SizedBox(
        height: 10,
      ),

      Text('Resposta'),
      textField(controller2)
    ],
  );
}

TextField textField(TextEditingController controller){
  return TextField(
        controller: controller,
        
        decoration: InputDecoration(
          labelText: 'Digite algo',
          border: OutlineInputBorder(),
        ),
      );
}