import 'package:flutter/material.dart';
import 'package:tubez/screens/isiList.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text('LIST FILM'),
          backgroundColor: const Color.fromARGB(255, 166, 149, 0),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              IsiList()
            ],
          ),
        ),
      ),
    );
  }
}