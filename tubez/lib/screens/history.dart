import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/historyWidgets/isiHistory.dart';
import 'package:tubez/widgets/historyWidgets/historyHeader.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> historyItems = [
    {
      'image': 'assets/images/spiderman.jpg',
      'title': 'SPIDER-MAN : INTO THE SPIDER-VERSE',
      'status': 'Completed',
      'studio': 1,
      'date': '07-10-2024',
      'total': 'Rp 45.000',
      'isReviewed': false,
      'ticketCount': 1,
    },
    {
      'image': 'assets/images/transformers.jpg',
      'title': 'TRANSFORMERS: RISE OF THE BEASTS',
      'status': 'Completed',
      'studio': 2,
      'date': '07-10-2024',
      'total': 'Rp 90.000',
      'isReviewed': true,
      'ticketCount': 2,
    },
    {
      'image': 'assets/images/spiderman.jpg',
      'title': 'SPIDER-MAN : INTO THE SPIDER-VERSE',
      'status': 'Completed',
      'studio': 3,
      'date': '07-10-2024',
      'total': 'Rp 225.000',
      'isReviewed': false,
      'ticketCount': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HistoryHeader(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            final item = historyItems[index];
            return IsiHistory(
              image: item['image'],
              title: item['title'],
              status: item['status'],
              studio: item['studio'],
              date: item['date'],
              total: item['total'],
              isReviewed: item['isReviewed'],
              ticketCount: item['ticketCount'],
            );
          },
        ),
      ),
    );
  }
}
