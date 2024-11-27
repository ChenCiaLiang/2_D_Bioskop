import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tubez/screens/spesialPromoDetail.dart';

final List<Map<String, dynamic>> spesialPromoList = [
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo', 'price': 10000},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo', 'price': 10000},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo', 'price': 10000},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo', 'price': 10000},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo', 'price': 10000},
];

class Spesialpromocarousel extends StatelessWidget {
  const Spesialpromocarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          height: 180.0,
          enlargeCenterPage: false,
          viewportFraction: 1),
      items: spesialPromoList.map((spesialPromo) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SpesialPromoDetailScreen(
                  itemTitle: spesialPromo['title']!,
                  itemImage: spesialPromo['image']!,
                  itemPrice: spesialPromo['price']!,
                )));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      spesialPromo['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
