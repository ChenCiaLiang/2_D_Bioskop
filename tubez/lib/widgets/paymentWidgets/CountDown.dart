import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  const CountDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Take up full width
      height: 40,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 63, 62, 62),
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
    );
  }
}
