import 'package:flutter/material.dart';

class IsiMenu {
  final List<Widget> menuBiasa;
  final List<Widget> menuPromo;

  IsiMenu({
    required this.menuBiasa,
    required this.menuPromo,
  });

  static IsiMenu sampleContent = IsiMenu( 
    menuPromo: [
      Container(
        width: 200,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('images/Americano_Float.png')
      ),
      Container(
        width: 200,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('images/Americano_Float.png')
      ),
      Container(
        width: 200,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('images/Americano_Float.png')
      ),
      Container(
        width: 200,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('images/Americano_Float.png')
      ),
      Container(
        width: 200,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('images/Choco_Popcorn.png')
      ),
    ],
    menuBiasa: [
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Image.asset(
              'images/Popcorn_and_Beans.png',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popcorn and Beans', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Delicious Popcorn',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Only Rp25.000', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}