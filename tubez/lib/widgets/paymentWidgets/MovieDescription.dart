import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Take up full width
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 63, 62, 62),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
        child: Row(
          children: [
            Image.asset(
              'assets/images/spiderman.jpg',
              width: 100,
              height: 160,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            const Expanded(
              // Added Expanded to wrap text
              child: Column(
                children: [
                  Text(
                    "SPIDER-MAN : INTO THE SPIDER-VERSE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    softWrap: true, // Ensure text wraps
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis, // Ellipsis if text overflows
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.clapperboard,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Atma Cinema",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                        softWrap: true, // Ensure text wraps
                        maxLines: 2,
                        overflow:
                            TextOverflow.ellipsis, // Ellipsis if text overflows
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Universitas Atma Jaya Yogyakarta",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                          softWrap: true, // Ensure text wraps
                          maxLines: 2,
                          overflow: TextOverflow
                              .ellipsis, // Ellipsis if text overflows
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Monday, 07 Desember 2003",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                          softWrap: true, // Ensure text wraps
                          maxLines: 2,
                          overflow: TextOverflow
                              .ellipsis, // Ellipsis if text overflows
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
