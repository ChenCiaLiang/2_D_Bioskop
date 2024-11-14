import 'package:flutter/material.dart';

class cinemaTypeWidget extends StatefulWidget {
  const cinemaTypeWidget({super.key});

  @override
  State<cinemaTypeWidget> createState() => _cinemaTypeWidgetState();
}

class _cinemaTypeWidgetState extends State<cinemaTypeWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(2, (index) {
          final isActive = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    isActive ? Colors.amber : Colors.transparent),
                foregroundColor: WidgetStatePropertyAll(
                  isActive ? Colors.white : Colors.white,
                ),
                padding: WidgetStatePropertyAll(
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                        color: isActive ? Colors.amber : Colors.white,
                        width: 2),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    index == 0 ? "Premium" : "Standard",
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
