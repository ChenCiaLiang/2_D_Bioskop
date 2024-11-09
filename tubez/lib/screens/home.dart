import 'package:flutter/material.dart';
import 'package:tubez/widgets/homeHeader.dart';
import 'package:carousel_slider/carousel_slider.dart';

final themeMode = ValueNotifier(2);

final List<Map<String, String>> movieList = [
  {'image': 'assets/images/deadpool.jpg', 'title': 'Deadpool'},
  {'image': 'assets/images/elemental.jpg', 'title': 'Elemental'},
  {'image': 'assets/images/transformers.jpg', 'title': 'Transformers'},
  {'image': 'assets/images/the_boys.jpg', 'title': 'The Boys'},
  {'image': 'assets/images/spiderman.jpg', 'title': 'Spiderverse'},
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
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height:
                    390.0, // Set a fixed height for the carousel to avoid overflow
                aspectRatio: 0.6, // Aspect ratio for vertical rectangles
                enlargeCenterPage: true,
              ),
              items: movieList.map((movie) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: Image.asset(
                            movie['image']!,
                            fit: BoxFit.cover,
                            width: 250,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8.0), // Space between image and text
                      Text(
                        movie['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
