import 'package:flutter/material.dart';

class PromoDetailScreen extends StatefulWidget {
  final String itemTitle;
  final String itemImage;
  final int itemPrice;

  PromoDetailScreen({
    required this.itemTitle,
    required this.itemImage,
    required this.itemPrice,
  });

  @override
  _PromoDetailScreenState createState() => _PromoDetailScreenState();
}

class _PromoDetailScreenState extends State<PromoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    widget.itemImage,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Color.fromARGB(36, 158, 158, 158),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Popcorn Original (M) + Jeruk Smoothie',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Syarat dan Ketentuan:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBulletPoint(
                      'Berlaku hanya di hari Senin hingga Jumat.'),
                  _buildBulletPoint(
                      'Infokan ke kasir saat ingin klaim promo ini.'),
                  _buildBulletPoint(
                      '1 member dapat klaim deals ini sebanyak 1x per hari.'),
                  _buildBulletPoint(
                      'Cek selalu masa berlaku promo.'),
                  const SizedBox(height: 16),
                  Text(
                    'Berlaku sampai dengan 2024-11-23',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Rp ${widget.itemPrice.toString()}',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[300], fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
