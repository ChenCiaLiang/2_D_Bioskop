import 'package:flutter/material.dart';
import 'package:tubez/entity/Film.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.filmList,
  });

  final List<Film> filmList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: filmList.map((movie) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://10.0.2.2:8000${movie.fotoFilm!}', // Ensure you append the correct path
                      width: 140,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 140,
                    child: Text(
                      movie.judul ?? 'No Title', // Handle null title
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          
        ),
      ),
    );
  }
}
