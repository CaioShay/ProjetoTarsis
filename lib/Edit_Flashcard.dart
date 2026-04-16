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
    title: Text('Editar Flashcard'),
    backgroundColor: Colors.blue,
    leading: ibVoltar(context),
  );
}

IconButton ibVoltar(BuildContext context){
  return IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back),
  );
}

FloatingActionButton fabSalvar(){
  return FloatingActionButton(
    onPressed: (){
      print(controller1.text);
      print(controller2.text);
    },
    backgroundColor: Colors.blue,
    child: Text('Salvar'),
    );
}

Column body(){
  return Column(
    children: [
      Text('Pergunta'),
      textField(controller1),

      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Divider(),
      ),
      
      Text('Resposta'),
      textField(controller2),
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