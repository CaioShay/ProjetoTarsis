import 'package:flutter/material.dart';
import './pages/home.dart';
void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int SelectedIndex = 0;
  final pages = [
    HomePage(),
    HomePage()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[SelectedIndex],

      appBar: AppBar(
        title: Text('Aplicativo de músics',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedIndex,
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
        ],
        
        onTap: (index){
          setState(() {
            SelectedIndex = index;
          });
        },
      ),

    );
  }
}
