import 'package:flutter/material.dart';
import 'package:tubez/screens/PromoDetail.dart';

final List<Map<String, dynamic>> promoList = [
  {'image': 'assets/images/promo.png', 'title': 'Promo1', 'price': 10000},
  {'image': 'assets/images/promo.png', 'title': 'Promo2', 'price': 20000},
  {'image': 'assets/images/promo.png', 'title': 'Promo3', 'price': 30000},
  {'image': 'assets/images/promo.png', 'title': 'Promo4', 'price': 40000},
  {'image': 'assets/images/promo.png', 'title': 'Promo5', 'price': 50000},
  {'image': 'assets/images/promo.png', 'title': 'Promo6', 'price': 40000},
  {'image': 'assets/images/promo.png', 'title': 'Promo7', 'price': 10000},
];

class Promo extends StatelessWidget {
  const Promo({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: promoList.length,
        itemBuilder: (context, index) {
          final promo = promoList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PromoDetailScreen(
                  itemTitle: promo['title']!,
                  itemImage: promo['image']!,
                  itemPrice: promo['price']!,
                )),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        promo['image']!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
