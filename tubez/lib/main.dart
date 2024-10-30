import 'package:flutter/material.dart';
import 'package:tubez/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: const Color.fromARGB(115, 56, 55, 55)),
      home: const LoginScreen(),
    );
  }
}
