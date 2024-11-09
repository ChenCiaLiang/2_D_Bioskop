import 'package:flutter/material.dart';
import 'package:tubez/screens/profile.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: SizedBox(
        height: size.height / 14,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(36, 158, 158, 158),
              radius: 25,
              child: Image.asset(
                'assets/images/logo.png', // Sesuaikan dengan path logo Anda
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 36,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 9),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const profileScreen()),
                );
              },
              child: CircleAvatar(
                radius: size.width / 16,
                backgroundImage: const AssetImage('assets/images/download.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
