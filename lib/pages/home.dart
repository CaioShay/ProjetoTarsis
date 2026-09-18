import 'package:flutter/material.dart';
import 'package:projeto/pages/explore.dart';
import 'package:projeto/pages/search.dart';
import 'package:projeto/pages/library.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int SelectedIndex = 1;
  final pages = [
    ExplorePage(),
    Search(),
    Library()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[SelectedIndex],

      appBar: AppBar(
        title: Text('Aplicativo de música',style: GoogleFonts.nunito(
            fontSize: 20,
            color: Colors.white
        ),),
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
