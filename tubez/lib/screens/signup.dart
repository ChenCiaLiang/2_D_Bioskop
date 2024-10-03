import 'package:flutter/material.dart';
import 'package:tubez/screens/login.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/checkbox.dart';
import 'package:tubez/widgets/primary_button.dart';
import 'package:tubez/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Text(
                  'Create Account',
                  style: titleText,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Row(
                  children: [
                    Text(
                      'Already a Member?',
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
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        'Log In',
                        style: textButton.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: kDefaultPadding,
                child: SignUpForm(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: kDefaultPadding,
                child: CheckBox('I have Agree to Terms and Conditions.'),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(buttonText: 'Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
