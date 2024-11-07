import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubez/screens/isiMenu.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text('LIST Menu'),
          backgroundColor: const Color.fromARGB(255, 166, 149, 0),
        ),
        body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('PROMO', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: IsiMenu.sampleContent.menuPromo,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child:  Text('Menu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: IsiMenu.sampleContent.menuBiasa,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
