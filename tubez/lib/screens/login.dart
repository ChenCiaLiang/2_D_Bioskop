import 'package:flutter/material.dart';
import 'package:tubez/screens/singup.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/login_form.dart';
import 'package:tubez/widgets/login_options.dart';
import 'package:tubez/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              'Welcome Back',
              style: titleText,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'New to this app?',
                  style: subTitle,
                ),
                SizedBox(
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
            SizedBox(
              height: 10,
            ),
            LoginForm(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Forgot password?',
              style: TextStyle(
                color: kZambeziColor,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationThickness: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(buttonText: 'Log In'),
            SizedBox(height: 30),
            Text(
              'Or log in with:',
              style: subTitle.copyWith(color: kBlackColor),
            ),
            SizedBox(
              height: 20,
            ),
            LoginOption(),
          ],
        ),
      ),
    );
  }
}
