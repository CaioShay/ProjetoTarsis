import 'package:flutter/material.dart';
import 'package:projeto/db/shared_prefs.dart';
import 'package:projeto/pages/home.dart';

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

  loadData() async{
    if (prefs.getUserStatus()){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context){
            return HomePage();
          })
      );
    }else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context){
        return LoginPage();
      }
      )
    }
  }

  @override
  Widget build(BuildContext context){
    return Center(child: Text('Loading'),);
  }
}