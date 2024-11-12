import 'package:flutter/material.dart';
import 'package:tubez/screens/movieDetail.dart';

final List<Map<String, String>> movieList = [
  {
    'image': 'assets/images/deadpool.jpg',
    'title': 'Deadpool Season 3 sangat panjang anjayyyyyyyaaaa'
  },
  {'image': 'assets/images/elemental.jpg', 'title': 'Elemental'},
  {
    'image': 'assets/images/transformers.jpg',
    'title': 'Transformers optimum pride anjay'
  },
  {'image': 'assets/images/the_boys.jpg', 'title': 'The Boys'},
  {'image': 'assets/images/spiderman.jpg', 'title': 'Spiderverse'},
];

class nowPlayingScreen extends StatefulWidget {
  const nowPlayingScreen({super.key});

  @override
  State<nowPlayingScreen> createState() => _nowPlayingScreenState();
}

class _nowPlayingScreenState extends State<nowPlayingScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => moveiDetailScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(), // Biar ga bisa ke scroll
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2, // Jumlah gambar yang tampil per gambar poster itu
            mainAxisSpacing: 13,
            crossAxisSpacing: 8,
            childAspectRatio:
                0.5, // Untuk ngatur jarak antar gambar yang sebagai child
          ),
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            final movie = movieList[index];
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent, // Background color to separate items
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Movie poster image
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        movie["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Movie title text

                  const SizedBox(height: 10),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            movie["title"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
