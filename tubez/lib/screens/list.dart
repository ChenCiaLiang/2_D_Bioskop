import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubez/widgets/HomeWidgets/homeHeader.dart';
import 'package:tubez/widgets/ListMenuWidgets/PromoHeader.dart';
import 'package:tubez/widgets/ListMenuWidgets/Menus.dart';
import 'package:tubez/widgets/ListMenuWidgets/SpesialPromoCarousel.dart';
import 'package:tubez/widgets/ListMenuWidgets/Promo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tubez/entity/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:tubez/entity/User.dart';
import 'package:tubez/client/MenuClient.dart';
import 'package:tubez/entity/Menu.dart';
import 'package:tubez/client/SpesialPromoClient.dart';
import 'package:tubez/entity/SpesialPromo.dart';
import 'package:tubez/client/UserClient.dart';

final themeMode = ValueNotifier(2);

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int? userId;
  User user = User(email: '', id: 0, username: '', password: '', noTelepon: '', tanggalLahir: '', foto: '');
  List<SpesialPromo> spesialPromoList = [];
  List<Menu> menuList = [];
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    ambilToken(); // Memanggil ambilToken() saat screen pertama kali dimuat
    super.initState();
    fetchDataMenu();
  }

  Future<void> ambilToken() async {
    UserClient userClient = UserClient();
    String? token = await userClient.getToken();

    if (token == null) {
      Navigator.pushReplacementNamed(context, '/login');
    }else{
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

  Future<void> fetchDataMenu() async {
    try {
      print('Test : ${user.email}');
      final data = await MenuClient.fetchAll();

      if(data.isEmpty){
        throw Exception('Data is empty');
      }

      setState(() {
        menuList = data;
      });

      // listMenu.forEach((menu) {
      //   print(menu.fotoMenu); // Assuming `Menu` is a `Menu` object with a `judul` attribute
      // });

    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> fetchDataSpesialPromo() async {
    try {
      print('Test : ${user.email}');
      final data = await SpesialPromoClient.fetchAll();

      if(data.isEmpty){
        throw Exception('Data is empty');
      }

      setState(() {
        spesialPromoList = data;
      });

      spesialPromoList.forEach((spesialPromo) {
        print(spesialPromo.fotoPromo);
      });

    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      child: const Text(
                        "Today's Special Offer!",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Spesialpromocarousel(),
                    const SizedBox(height: 20),
                    const PromoHeader(),
                    const SizedBox(height: 20),
                    Promo(),
                    const SizedBox(height: 20),
                    Menus(menuList: menuList),
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
