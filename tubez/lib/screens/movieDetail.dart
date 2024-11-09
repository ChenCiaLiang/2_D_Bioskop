import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tubez/widgets/MovieDetailWidgets/MovieDescription.dart';
import 'package:tubez/widgets/MovieDetailWidgets/BackButton.dart';

class moveiDetailScreen extends StatefulWidget {
  const moveiDetailScreen({super.key});

  @override
  State<moveiDetailScreen> createState() => _moveiDetailScreenState();
}

class _moveiDetailScreenState extends State<moveiDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/spiderman.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 35, 35, 35),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Stack(
                      children: [
                        MovieDescription(),
                        SizedBox(height: 20),
                        Positioned(
                          top: 240,
                          left: 15,
                          child: Column(
                            children: [
                              Container(
                                child: const Text(
                                  "Schedule",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.transparent),
                                      foregroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.white),
                                      padding: const WidgetStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              vertical: 14.0,
                                              horizontal: 14.0)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        side: const BorderSide(
                                            color: Colors.white, width: 2),
                                      )),
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Today",
                                            style: TextStyle(fontSize: 12.0)),
                                        SizedBox(height: 4),
                                        Text("07",
                                            style: TextStyle(fontSize: 12.0)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const BackButtonWidget(),
          ],
        ),
      ),
    );
  }
}
