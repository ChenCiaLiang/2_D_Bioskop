import 'package:flutter/material.dart';

class HistoryHeader extends StatelessWidget implements PreferredSizeWidget {
  const HistoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 110,
      backgroundColor: Color(0xFF272726),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(36, 158, 158, 158),
            radius: 30,
            child: Image.asset(
              'assets/images/logo.png',
              height: 60,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110.0);
}
