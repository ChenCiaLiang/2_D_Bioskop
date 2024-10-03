import 'package:flutter/material.dart';
import 'package:tubez/screens/list.dart';
import 'package:tubez/screens/login.dart';
import 'package:tubez/screens/profile.dart';
import 'package:tubez/widgets/navigation.dart';
import 'package:tubez/controller/navigationcontroller.dart';
import 'package:tubez/theme.dart';
import 'package:get/get.dart';

class homeScreeen extends StatefulWidget {
  const homeScreeen({super.key});

  @override
  State<homeScreeen> createState() => _homeScreeenState();
}

class _homeScreeenState extends State<homeScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kDefaultPadding,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 174, 172, 167)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 174, 172, 167),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(150, 185, 181, 181)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'Now Playing',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      width: 180,
                    ),
                    Text(
                      'More',
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.play_arrow_rounded)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
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
                              'images/elemental.jpg',
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 140,
                            child: Text(
                              'Elemental',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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
                              'images/the boys.jpg',
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 140,
                            child: Text(
                              'The Boys',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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
                              'images/actsv.jpg',
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 140,
                            child: Text(
                              'Accross The Spider Verse',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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
                              'images/transformers.jpg',
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 140,
                            child: Text(
                              'Transformers: Rise of The Beast',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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
                              'images/deadpool.jpg',
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 140,
                            child: Text(
                              'Deadpool & Wolverine',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Hai ini buat batasan'),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sementara Ke Log in',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const profileScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sementara Ke Profile',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sementara Ke List',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
