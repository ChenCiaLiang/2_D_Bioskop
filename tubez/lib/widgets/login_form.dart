import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubez/theme.dart';

final _loginFormKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  Future<bool> _login() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    if(storedEmail == emailController.text && storedPassword == passwordController.text){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          buildInputForm('Email', false, emailController),
          buildInputForm('Password', true, passwordController),
          ElevatedButton(
            onPressed: () async {
              if (_loginFormKey.currentState!.validate()) {
                bool success = await _login();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Login successful!"),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Invalid credentials!"),
                  ));
                }
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  Padding buildInputForm(String label, bool pass, TextEditingController controllerInput) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5), 
      child: TextFormField(
        controller: controllerInput,
        obscureText: pass ? isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      color: kTextFieldColor,
                    ),
                  )
                : null),
                validator: (String? value){
                if(value == null || value.isEmpty){
                  return '$label tidak boleh kosong';
                }else if(label == 'email' && !value.contains('@')){
                  return 'Email harus ada @';
                }
                return null;
              },
      ),
    );
  }
}
