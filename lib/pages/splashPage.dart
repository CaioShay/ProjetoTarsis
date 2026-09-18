import 'package:flutter/material.dart';
import 'package:projeto/db/shared_prefs.dart';
import 'package:projeto/pages/home.dart';

import 'login.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    if (await prefs.getUserStatus()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context){
            return HomePage();
          })
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context){
            return LoginPage();
          })
      );
    }
  }

  @override
  Widget build(BuildContext context){
    // Adicionei um Scaffold para evitar que a tela de loading fique com fundo preto
    return Scaffold(
      body: Center(child: Text('Loading')),
    );
  }
}