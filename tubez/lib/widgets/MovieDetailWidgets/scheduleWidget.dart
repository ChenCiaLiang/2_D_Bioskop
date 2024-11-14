import 'package:flutter/material.dart';

class Schedulewidget extends StatefulWidget {
  const Schedulewidget({super.key});

  @override
  State<Schedulewidget> createState() => _SchedulewidgetState();
}

class _SchedulewidgetState extends State<Schedulewidget> {
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
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                  Text(dayName, style: const TextStyle(fontSize: 12.0)),
                  const SizedBox(height: 4),
                  Text(dayNumber, style: const TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
