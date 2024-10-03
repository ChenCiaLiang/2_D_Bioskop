import 'package:flutter/material.dart';
import 'package:tubez/screens/home.dart';
import 'package:tubez/screens/signup.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/login_form.dart';
import 'package:tubez/widgets/login_options.dart';
import 'package:tubez/widgets/navigation.dart';
import 'package:tubez/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Text(
              'Welcome Back',
              style: titleText,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'New to this app?',
                  style: subTitle,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const LoginForm(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Forgot password?',
              style: TextStyle(
                color: kZambeziColor,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationThickness: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const navigationBar()));
              },
              child: Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(buttonText: 'Log In'),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Or log in with:',
              style: subTitle.copyWith(color: kBlackColor),
            ),
            const SizedBox(
              height: 20,
            ),
            const LoginOption(),
          ],
        ),
      ),
    );
  }
}
