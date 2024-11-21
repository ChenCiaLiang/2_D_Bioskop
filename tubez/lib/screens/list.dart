import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';
import 'package:tubez/widgets/ListMenuWidgets/PromoHeader.dart';
import 'package:tubez/widgets/ListMenuWidgets/Menu.dart';
import 'package:tubez/widgets/ListMenuWidgets/SpesialPromoCarousel.dart';
import 'package:tubez/widgets/ListMenuWidgets/Promo.dart';
import 'package:carousel_slider/carousel_slider.dart';

final themeMode = ValueNotifier(2);

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(size: size),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: const Text(
                  "Today's Special Offer!",
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
              const PromoHeader(),
              const SizedBox(height: 20),
              const Promo(),
              const SizedBox(height: 20),
              Menu(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
