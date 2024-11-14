import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tubez/screens/movieDetail.dart';

final List<Map<String, String>> movieList = [
  {'image': 'assets/images/deadpool.jpg', 'title': 'Deadpool'},
  {'image': 'assets/images/elemental.jpg', 'title': 'Elemental'},
  {'image': 'assets/images/transformers.jpg', 'title': 'Transformers'},
  {'image': 'assets/images/the_boys.jpg', 'title': 'The Boys'},
  {'image': 'assets/images/spiderman.jpg', 'title': 'Spiderverse'},
];

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          height: 370.0,
          aspectRatio: 0.6,
          enlargeCenterPage: true,
          viewportFraction: 0.7),
      items: movieList.map((movie) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => moveiDetailScreen()));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      movie['image']!,
                      fit: BoxFit.cover,
                      width: 250,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0), // Space between image and text
                Text(
                  movie['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
