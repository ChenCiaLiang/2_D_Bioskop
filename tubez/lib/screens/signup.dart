import 'package:flutter/material.dart';
import 'package:tubez/screens/login.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/checkbox.dart';
import 'package:tubez/widgets/primary_button.dart';
import 'package:tubez/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Text(
                  'Create Account',
                  style: titleText,
                ),
              ),
              SizedBox(
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
                    SizedBox(
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: kDefaultPadding,
                child: CheckBox('I have Agree to Terms and Conditions.'),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(
                  buttonText: 'Sign Up'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
