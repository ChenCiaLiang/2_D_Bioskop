import 'package:flutter/material.dart';
import 'package:tubez/widgets/HomeWidgets/TopRated.dart';
import 'package:tubez/widgets/HomeWidgets/TopRatedHeader.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';
import 'package:tubez/widgets/HomeWidgets/NowPlayingHeader.dart';
import 'package:tubez/widgets/HomeWidgets/HomeCarousel.dart';
import 'package:tubez/widgets/HomeWidgets/ComingSoonHeader.dart';
import 'package:tubez/widgets/HomeWidgets/ComingSoon.dart';
import 'package:tubez/client/UserClient.dart';
import 'dart:convert';
import 'package:tubez/entity/User.dart';

final themeMode = ValueNotifier(2);

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? userId;
  User user = User(
      email: '',
      id: 0,
      username: '',
      password: '',
      noTelepon: '',
      tanggalLahir: '',
      foto: '');

  Future<void> ambilToken() async {
    UserClient userClient = UserClient();
    String? token = await userClient.getToken();

    if (token == null) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      final response = await userClient.dataUser(token);

      if (response.statusCode == 200) {
        // Mengambil data dari response body
        var data = json.decode(response.body);
        user = User.fromJson(data['data']);

        setState(() {
          userId = user.id; // Menyimpan userId di state
        });

        print('User ID: $userId');
        print('Nama User: ${user.username}');
      } else {
        print('Failed to load user data');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ambilToken(); // Memanggil ambilToken() saat screen pertama kali dimuat
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(size: size, user: user),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Welcome, ${user.username}',
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
