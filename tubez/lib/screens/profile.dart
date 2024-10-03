import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(FontAwesomeIcons.arrowLeftLong),
        ),
        leadingWidth: 80,
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(
            thickness: 1,
            color: Color.fromARGB(104, 178, 178, 178),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 1,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("images/download.png"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Agus Fefek',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '+62 0812 6667 6969',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 111, 111, 111)),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'agussukadudamapan@fefek.com',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 111, 111, 111)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(104, 178, 178, 178),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  const BuildButton({super.key, required this.iconImage});
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: mediaQuery.height * 0.06,
      width: mediaQuery.width * 0.16,
      child: iconImage,
    );
  }
}
