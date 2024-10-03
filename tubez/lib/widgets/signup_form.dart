import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tubez/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _formKey = GlobalKey<FormState>();

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstNameController.text);
    await prefs.setString('lastName', lastNameController.text);
    await prefs.setString('dateOfBirth', dateBirthController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('password', passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildInputForm('First Name', false, firstNameController),
          buildInputForm('Last Name', false, lastNameController),
          buildInputForm('Date Birth', false, dateBirthController),
          buildInputForm('Email', false, emailController),
          buildInputForm('Phone', false, phoneController),
          buildInputForm('Password', true, passwordController),
          buildInputForm('Confirm Password', true, confirmPasswordController),
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()){
                if(passwordController.text == confirmPasswordController.text){
                  _saveUserData();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Sign Up!"),));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password tidak Sesuai!"),));
                }
              }
            }, 
            child: Text("Sign Up"),
          ),
        ],
      ),
    );
  }

  Padding buildInputForm(String hint, bool pass, TextEditingController controllerInput) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5), 
        child: 
            TextFormField(
              controller: controllerInput,
              obscureText: pass ? _isObscure : false,
              decoration: InputDecoration(
                hintText: hint, 
                hintStyle: TextStyle(color: kTextFieldColor), 
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
                suffixIcon: pass  
                ? IconButton(
                    onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure ? 
                      Icon(
                        Icons.visibility_off, 
                        color: kTextFieldColor,
                      ) 
                    : Icon(
                          Icons.visibility, 
                          color: kTextFieldColor,
                      )) 
                : null,
              ),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return '$hint tidak boleh kosong';
                }else if(hint == 'email' && !value.contains('@')){
                  return 'Email harus ada @';
                }
                return null;
              },
            ),
      );
  }
}