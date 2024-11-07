import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/theme.dart';

class selectSeatScreen extends StatelessWidget {
  const selectSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ArrowBackButton(),
            const Title(),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  statusRow(
                      color: Colors.yellow, content: 'Selected', boxText: 'A1'),
                  statusRow(
                      color: Colors.red, content: 'Unavailable', boxText: 'A1'),
                  statusRow(
                      color: Colors.transparent,
                      content: 'Available',
                      boxText: 'A1'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            )
          ],
        ),
      ),
    );
  }

  Row statusRow(
      {required Color color, required String content, String? boxText}) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (boxText != null)
                    Text(
                      boxText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: const Text(
        'Pick a Seat',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 4),
      child: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
