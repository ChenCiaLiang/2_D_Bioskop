import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  const Promo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/elemental.jpg',
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 140,
                  child: Text(
                    'Elemental',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/elemental.jpg',
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 140,
                  child: Text(
                    'The Boys',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/elemental.jpg',
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 140,
                  child: Text(
                    'Accross The Spider Verse',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/elemental.jpg',
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 140,
                  child: Text(
                    'Transformers: Rise of The Beast',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/elemental.jpg',
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 140,
                  child: Text(
                    'Deadpool & Wolverine',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: const Text(
                    'Promo',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: const Text(
                    'see more ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
