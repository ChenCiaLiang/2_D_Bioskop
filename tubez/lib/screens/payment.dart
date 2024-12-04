import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:tubez/widgets/MovieDetailWidgets/BackButton.dart';

class paymentScreenState extends StatefulWidget {
  const paymentScreenState({super.key});

  @override
  State<paymentScreenState> createState() => _paymentScreenStateState();
}

class _paymentScreenStateState extends State<paymentScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(children: [
              const BackButtonWidget(),
              SizedBox(width: 20),
              Text(
                "Order Confirmation",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
          ),
          // Positioned widget can be tricky, ensure it's placed well.
          Align(
            alignment: Alignment.topCenter, // Align it at the bottom center
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12,
                  top: 70), // Padding around the container
              child: Container(
                width: MediaQuery.of(context).size.width, // Take up full width
                height: 50,
                decoration: const BoxDecoration(
                    color: const Color.fromARGB(255, 63, 62, 62),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Complete order in",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.amber),
                      ),
                      Spacer(),
                      Text(
                        "02:59",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.amber),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
