import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tubez/screens/spesialPromoDetail.dart';

final List<Map<String, String>> spesialPromoList = [
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo'},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo'},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo'},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo'},
  {'image': 'assets/images/SpesialPromo.png', 'title': 'Spesial Promo'},
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
                MaterialPageRoute(builder: (context) => spesialPromoDetailScreen()));
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
