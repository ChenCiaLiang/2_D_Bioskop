import 'package:flutter/material.dart';
import 'package:tubez/screens/comingSoonScreen.dart';
import 'package:tubez/screens/nowPlayingScreen.dart';
import 'package:tubez/screens/topRatedScreen.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';

class seeMoreScreen extends StatefulWidget {
  const seeMoreScreen({super.key});

  @override
  State<seeMoreScreen> createState() => _seeMoreScreenState();
}

class _seeMoreScreenState extends State<seeMoreScreen> with TickerProviderStateMixin{
  int selectedIndex = 0;
  

  @override
  Widget build(BuildContext context) {
  
    TextButton buttonMore(String text, int index){
      final bool isSelected = selectedIndex == index;
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          foregroundColor: isSelected ? Colors.black : Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10),
          fixedSize: const Size(100, 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)), 
            side: const BorderSide(
              color: Colors.white,
              width: 2.0,)
          ),
        ),
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Text(
          text, 
          style: TextStyle(fontSize: 11, color: isSelected ? Colors.black : Colors.white),
        ),
      );
    }

    Widget _tampilKonten() {
      switch (selectedIndex) {
        case 0:
          return nowPlayingScreen();
        case 1:
          return comingSoonScreen();
        case 2:
          return topRatedScreen();
        default:
          return nowPlayingScreen();
      }
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text('Movie List', style: TextStyle(color: Colors.white)), iconTheme: IconThemeData(color: Colors.white),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonMore("Now Playing", 0),
                  const SizedBox(width: 16),
                  buttonMore("Coming Soon", 1),
                  const SizedBox(width: 16),
                  buttonMore("Top Rated", 2),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _tampilKonten(),
          ],
        ),
      ),
    );
  }
}