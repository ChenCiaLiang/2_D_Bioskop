import 'package:flutter/material.dart';
import 'package:tubez/service/directToLink.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildButton(
          iconImage: Image(
              height: 35, width: 35, image: AssetImage('images/facebook.png')),
          onPressed: () {
            Direct.launchURL('https://www.instagram.com/');
          },
        ),
        BuildButton(
          iconImage: Image(
              height: 35, width: 35, image: AssetImage('images/gugel.png')),
          onPressed: () {
            Direct.launchURL('https://www.instagram.com/');
          },
        ),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  BuildButton({required this.iconImage, required Null Function() onPressed});
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.06,
      width: mediaQuery.width * 0.16,
      child: iconImage,
    );
  }
}
