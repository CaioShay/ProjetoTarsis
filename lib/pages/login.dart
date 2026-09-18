import 'package:flutter/material.dart';
import 'package:projeto/db/user_dao.dart';
import 'package:projeto/db/shared_prefs.dart';
import 'package:projeto/pages/explore.dart';
import 'package:projeto/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool can_be_pressed = true;
  UserDao user_dao = UserDao();
  SharedPrefs prefs = SharedPrefs();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: controller1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (!can_be_pressed){
                return;
              }

              can_be_pressed = false;

              final success = await user_dao.login(
                controller1.text,
                controller2.text,
              );
              if (success) {
                await prefs.setUserStatus(true);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              }else{
                can_be_pressed = true;
                showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Falha no login.'),
                        content: Text('Usuário e/ou senha incorreta.'),
                      );
                    }
                );
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
