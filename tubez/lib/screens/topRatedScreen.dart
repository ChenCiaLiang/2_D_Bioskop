import 'package:flutter/material.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';

final List<Map<String, String>> movieList = [
  {'image': 'assets/images/deadpool.jpg', 'title': 'Deadpool Season 3 sangat panjang anjay'},
  {'image': 'assets/images/elemental.jpg', 'title': 'Elemental'},
  {'image': 'assets/images/transformers.jpg', 'title': 'Transformers optimum pride anjay'},
  {'image': 'assets/images/the_boys.jpg', 'title': 'The Boys'},
  {'image': 'assets/images/spiderman.jpg', 'title': 'Spiderverse'},
];

class topRatedScreen extends StatefulWidget {
  const topRatedScreen({super.key});

  @override
  State<topRatedScreen> createState() => _topRatedScreenState();
}

class _topRatedScreenState extends State<topRatedScreen> with TickerProviderStateMixin{

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
          mainAxisSpacing: 16,
          crossAxisSpacing: 16, // Untuk ngatur jarak antar gambar yang sebagai child
        ),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black, // Background color to separate items
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Movie poster image
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      movie["image"]!,
                      fit: BoxFit.cover,
                      
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Movie title text
                
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
            ),
          );
        },
      ),
    );
  }
}