import 'package:flutter/material.dart';
import 'package:tubez/screens/menuDetail.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedTab = 0;

  final List<Map<String, String>> makananList = [
    {'image': 'assets/images/Makanan.png', 'title': 'Makanan'},
    {'image': 'assets/images/Makanan.png', 'title': 'Makanan'},
  ];

  final List<Map<String, String>> minumanList = [
    {'image': 'assets/images/Minuman.png', 'title': 'Minuman'},
    {'image': 'assets/images/Minuman.png', 'title': 'Minuman'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 0;
                });
              },
              child: Text(
                'Menu',
                style: TextStyle(
                  color: selectedTab == 0 ? Colors.white : Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 1;
                });
              },
              child: Text(
                'Makanan',
                style: TextStyle(
                  color: selectedTab == 1 ? Colors.white : Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 2;
                });
              },
              child: Text(
                'Minuman',
                style: TextStyle(
                  color: selectedTab == 2 ? Colors.white : Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GridView.builder(
          padding: EdgeInsets.all(16.0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _getSelectedItems().length,
          itemBuilder: (context, index) {
            final item = _getSelectedItems()[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuDetailScreen(
                      itemTitle: item['title']!,
                      itemImage: item['image']!,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[900],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['title']!,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Map<String, String>> _getSelectedItems() {
    if (selectedTab == 1) {
      return makananList;
    } else if (selectedTab == 2) {
      return minumanList;
    } else {
      return [...makananList, ...minumanList];
    }
  }
}
