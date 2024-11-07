import 'package:flutter/material.dart';
import 'package:tubez/widgets/homeHeader.dart';
import 'package:carousel_slider/carousel_slider.dart';

final themeMode = ValueNotifier(2);

final List<String> imgList = [
  'assets/images/deadpool.jpg',
  'assets/images/elemental.jpg',
  'assets/images/transformers.jpg',
  'assets/images/theboys.jpg',
  'assets/images/theboys.jpg',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                'Welcome, Zefanto ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: const Text(
                    'Now Playing ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 180,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: const Text(
                    'see more ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList.map((imgUrl) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
