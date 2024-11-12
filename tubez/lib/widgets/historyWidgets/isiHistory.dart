import 'package:flutter/material.dart';
import 'package:tubez/widgets/historyWidgets/editReview.dart';
import 'package:tubez/widgets/historyWidgets/isiReview.dart';

class IsiHistory extends StatelessWidget {
  const IsiHistory({
    super.key,
    required this.image,
    required this.title,
    required this.status,
    required this.studio,
    required this.date,
    required this.total,
    required this.isReviewed,
    required this.ticketCount,
  });

  final String image;
  final String title;
  final String status;
  final int studio;
  final String date;
  final String total;
  final bool isReviewed;
  final int ticketCount;

  @override
  Widget build(BuildContext context) {
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
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Studio: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      '$studio',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Date: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Total: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total,
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Tickets: $ticketCount',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 67),
              isReviewed
                  ? SizedBox(
                      width: 100,
                      height: 30,
                      child: OutlinedButton(
                        onPressed: () => showEditReview(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            'Reviewed',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () => showIsiReview(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            'Review',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
