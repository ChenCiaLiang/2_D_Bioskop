import 'package:flutter/material.dart';
import 'package:tubez/screens/selectSeat.dart';
import 'dart:ui';
import 'package:tubez/widgets/MovieDetailWidgets/MovieDescription.dart';
import 'package:tubez/widgets/MovieDetailWidgets/BackButton.dart';
import 'package:tubez/widgets/MovieDetailWidgets/scheduleWidget.dart';
import 'package:tubez/widgets/MovieDetailWidgets/timeWidget.dart';
import 'package:tubez/widgets/MovieDetailWidgets/cinemaTypeWidget.dart';
import 'package:tubez/entity/Film.dart';

class moveiDetailScreen extends StatefulWidget {
  const moveiDetailScreen({super.key, required this.movie});

  final Film movie;

  @override
  State<moveiDetailScreen> createState() => _moveiDetailScreenState();
}

class _moveiDetailScreenState extends State<moveiDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Film movie = widget.movie;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.network(
                'http://10.0.2.2:8000${movie.fotoFilm!}',
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
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    MovieDescription(movie: movie),
                    const SizedBox(height: 20),
                    Positioned(
                      top: 240,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Wrap(
                              spacing: 15.0,
                              runSpacing: 8.0,
                              children: List.generate(5, (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Text(
                                    "${movie.genre}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Schedule",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Schedulewidget(),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: TimeWidget(),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: cinemaTypeWidget(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 260,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => selectSeatScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 90, vertical: 15),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BackButtonWidget(),
          ],
        ),
      ),
    );
  }
}
