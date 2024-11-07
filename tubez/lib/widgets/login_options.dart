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
          iconImage: const Image(
              height: 35,
              width: 35,
              image: AssetImage('assets/images/facebook.png')),
          onPressed: () {
            Direct.launchURL('https://www.instagram.com/');
          },
        ),
        BuildButton(
          iconImage: const Image(
              height: 35,
              width: 35,
              image: AssetImage('assets/images/gugel.png')),
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
  const BuildButton(
      {super.key, required this.iconImage, required Null Function() onPressed});
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
