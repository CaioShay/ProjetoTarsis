import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: controller1,
          ),
          SizedBox(height: 100,),
          TextField(
            controller: controller2,
          )
        ],
      ),
    );
  }
}