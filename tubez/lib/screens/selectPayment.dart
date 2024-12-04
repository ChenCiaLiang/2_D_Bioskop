import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:tubez/widgets/MovieDetailWidgets/BackButton.dart';

class selectPaymentScreen extends StatefulWidget {
  const selectPaymentScreen({super.key});

  @override
  State<selectPaymentScreen> createState() => _selectPaymentScreenState();
}

class _selectPaymentScreenState extends State<selectPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        BackButtonWidget(),
        Positioned(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [Container(child: Text('Payment Method'))],
          ),
        ))
      ],
    )));
  }
}
