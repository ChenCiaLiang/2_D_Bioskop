import 'package:flutter/material.dart';


class IsiList extends StatefulWidget {
  const IsiList({super.key});

  @override
  State<IsiList> createState() => _IsiListState();
}

class _IsiListState extends State<IsiList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 50,
          height: 80,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Image.asset('images/discord.png')
        ),
        Container(
          width: 50,
          height: 80,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Image.asset('images/discord.png')
        )
      ],
    );
  }
}