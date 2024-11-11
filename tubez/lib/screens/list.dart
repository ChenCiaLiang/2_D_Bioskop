import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';
import 'package:tubez/widgets/ListMenuWidgets/SpesialPromoCarousel.dart';
import 'package:tubez/widgets/ListMenuWidgets/Promo.dart';
import 'package:carousel_slider/carousel_slider.dart';

final themeMode = ValueNotifier(2);

final List<Map<String, String>> promoList = [
  {'image': 'assets/images/promo.png', 'title': 'promo'},
  {'image': 'assets/images/promo.png', 'title': 'promo'},
  {'image': 'assets/images/promo.png', 'title': 'promo'},
  {'image': 'assets/images/promo.png', 'title': 'promo'},
  {'image': 'assets/images/promo.png', 'title': 'promo'},
];

final List<Map<String, String>> makananList = [
  {'image': 'assets/images/makanan.png', 'title': 'makanan'},
  {'image': 'assets/images/makanan.png', 'title': 'makanan'},
  {'image': 'assets/images/makanan.png', 'title': 'makanan'},
  {'image': 'assets/images/makanan.png', 'title': 'makanan'},
  {'image': 'assets/images/makanan.png', 'title': 'makanan'},
];

final List<Map<String, String>> minumanList = [
  {'image': 'assets/images/minuman.png', 'title': 'minuman'},
  {'image': 'assets/images/minuman.png', 'title': 'minuman'},
  {'image': 'assets/images/minuman.png', 'title': 'minuman'},
  {'image': 'assets/images/minuman.png', 'title': 'minuman'},
  {'image': 'assets/images/minuman.png', 'title': 'minuman'},
];


class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(size: size),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                "Today's Spesial Offer!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Spesialpromocarousel(),
            const SizedBox(height: 20),
            const Promo(),
          ],
        ),
      ),
    );
  }
}
