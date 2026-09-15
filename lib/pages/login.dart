import 'package:flutter/material.dart';
import 'package:projeto/db/user_dao.dart';
import 'package:projeto/db/shared_prefs.dart';
import 'package:projeto/pages/home.dart';

class LoginPage extends StatefulWidget{
  @override State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  UserDao user_dao = UserDao()
  SharedPrefs prefs = SharedPrefs()

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
          ),
          SizedBox(height: 100),
          ElevatedButton(onPressed: (){
              if (user_dao.login(controller1,controller2)){
                prefs.setUserStatus(true);

                Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context){
            return HomePage();
          })
      );
              }
          }, child: Text('Login'))
        ],
      ),
    );
  }
}