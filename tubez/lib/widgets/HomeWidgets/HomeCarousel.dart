import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tubez/screens/movieDetail.dart';
import 'package:tubez/entity/Film.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    super.key,
    required this.filmList,
  });

  final List<Film> filmList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          height: 370.0,
          aspectRatio: 0.6,
          enlargeCenterPage: true,
          viewportFraction: 0.65),
      items: filmList.map((movie) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => moveiDetailScreen(movie: movie,)));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      'http://10.0.2.2:8000${movie.fotoFilm!}',
                      fit: BoxFit.cover,
                      width: 220,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0), // Space between image and text
                Text(
                  movie.judul!,
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
