import 'package:flutter/material.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';

final List<Map<String, String>> movieList = [
  {'image': 'assets/images/deadpool.jpg', 'title': 'Deadpool'},
  {'image': 'assets/images/elemental.jpg', 'title': 'Elemental'},
  {'image': 'assets/images/transformers.jpg', 'title': 'Transformers'},
  {'image': 'assets/images/the_boys.jpg', 'title': 'The Boys'},
  {'image': 'assets/images/spiderman.jpg', 'title': 'Spiderverse'},
];

class nowPlayingScreen extends StatefulWidget {
  const nowPlayingScreen({super.key});

  @override
  State<nowPlayingScreen> createState() => _nowPlayingScreenState();
}

class _nowPlayingScreenState extends State<nowPlayingScreen> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // Biar ga bisa ke scroll
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Jumlah gambar yang tampil per gambar poster itu
          mainAxisSpacing: 13,
          crossAxisSpacing: 8,
          childAspectRatio: 0.6, // Untuk ngatur jarak antar gambar yang sebagai child
        ),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Column(
            children: [
              // Movie poster image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  movie["image"]!,
                  fit: BoxFit.cover,
                  height: 280,
                  width: 180,
                ),
              ),
              const SizedBox(height: 8),
              // Movie title text
              Text(
                movie["title"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}