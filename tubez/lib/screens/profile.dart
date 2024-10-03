import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/checkbox.dart';
import 'package:tubez/widgets/primary_button.dart';

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
        title: Text('My Profile', style: titleText),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildButton(
                iconImage: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('images/download.png')),
              ),
            ],
          )
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
