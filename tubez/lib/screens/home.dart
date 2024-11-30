import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tubez/model/tiket.dart';
import 'package:tubez/network/tiket_repository.dart';
import 'package:tubez/widgets/HomeWidgets/TopRated.dart';
import 'package:tubez/widgets/HomeWidgets/TopRatedHeader.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';
import 'package:tubez/widgets/HomeWidgets/NowPlayingHeader.dart';
import 'package:tubez/widgets/HomeWidgets/HomeCarousel.dart';
import 'package:tubez/widgets/HomeWidgets/ComingSoonHeader.dart';
import 'package:tubez/widgets/HomeWidgets/ComingSoon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubez/client/UserClient.dart';


final themeMode = ValueNotifier(2);

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tiket>? _data;

  Future<void> ambilToken() async {
    UserClient userClient = UserClient();
    String? token = await userClient.getToken();

    if (token == null) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(size: size),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 180,
                      width: 380,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/images/venom.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const NowPlayingHeader(),
                    const SizedBox(height: 20),
                    const HomeCarousel(),
                    const SizedBox(height: 20),
                    const ComingSoonHeader(),
                    const SizedBox(height: 20),
                    const ComingSoon(),
                    const SizedBox(height: 20),
                    const TopratedHeader(),
                    const SizedBox(height: 20),
                    const TopRated(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
