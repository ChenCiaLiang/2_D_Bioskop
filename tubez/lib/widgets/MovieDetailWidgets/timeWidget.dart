import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(7, (index) {
          final day = now.add(Duration(days: index));
          final dayName = index == 0 ? "Today" : "Day ${index + 1}";
          final dayNumber = day.day.toString().padLeft(2, '0');
          final isActive = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () {
                setState() {
                  selectedIndex = index;
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    isActive ? Colors.amber : Colors.transparent),
                foregroundColor: WidgetStatePropertyAll(
                  isActive ? Colors.white : Colors.white,
                ),
                padding: WidgetStatePropertyAll(
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
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
                  Text("18.00", style: const TextStyle(fontSize: 10.0)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
