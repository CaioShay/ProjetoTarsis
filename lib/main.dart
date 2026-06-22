import 'package:flutter/material.dart';
import 'package:projeto/pages/library.dart';
import 'package:projeto/pages/search.dart';
import './pages/home.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int SelectedIndex = 1;
  final pages = [
    HomePage(),
    Search(),
    Library()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[SelectedIndex],

      appBar: AppBar(
        title: Text('Aplicativo de música',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        
        ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedIndex,
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
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
