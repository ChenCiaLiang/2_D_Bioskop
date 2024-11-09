import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Dummy data untuk riwayat
  final List<Map<String, dynamic>> historyItems = [
    {
      'image': 'assets/images/spiderman.jpg',
      'title': 'SPIDER-MAN : INTO THE SPIDER-VERSE',
      'status': 'Completed',
      'studio': 'Studio: 1',
      'date': '07-10-2024',
      'total': 'Rp 45.000',
      'isReviewed': false,
      'ticketCount': 1,
    },
    {
      'image': 'assets/images/transformers.jpg',
      'title': 'TRANSFORMERS: RISE OF THE BEASTS',
      'status': 'Completed',
      'studio': 'Studio: 1',
      'date': '07-10-2024',
      'total': 'Rp 90.000',
      'isReviewed': true,
      'ticketCount': 2,
    },
    {
      'image': 'assets/images/spiderman.jpg',
      'title': 'SPIDER-MAN : INTO THE SPIDER-VERSE',
      'status': 'Completed',
      'studio': 'Studio: 1',
      'date': '07-10-2024',
      'total': 'Rp 225.000',
      'isReviewed': false,
      'ticketCount': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 35, 35, 35),
        leadingWidth: 80,
        title: const Text(
          'History',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromARGB(205, 205, 144, 3)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            final item = historyItems[index];
            return buildHistoryItem(
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

  Widget buildHistoryItem({
    required String image,
    required String title,
    required String status,
    required String studio,
    required String date,
    required String total,
    required bool isReviewed,
    required int ticketCount,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF424242),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 80,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Status: $status',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  '$studio',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Date: $date',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  'Total: $total',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          isReviewed
              ? OutlinedButton(
                  onPressed: () {},
                  child: Text('Reviewed',
                      style: TextStyle(color: Colors.white, fontSize: 11)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {},
                  child: Text('Give A Review', style: TextStyle(fontSize: 11)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                ),
        ],
      ),
    );
  }
}
