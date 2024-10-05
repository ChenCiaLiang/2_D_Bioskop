import 'package:flutter/material.dart';
import 'package:tubez/screens/register.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/login_options.dart';
import 'package:tubez/widgets/navigation.dart';
import 'package:tubez/component/form_component.dart';
import 'package:tubez/screens/profile.dart';

class LoginScreen extends StatefulWidget {
  final Map? data;

  const LoginScreen({super.key, this.data});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Map? dataForm = widget.data;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 180,
              ),
              Text(
                'Welcome Back',
                style: titleText,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: kDefaultPadding,
                child: 
                  Row(
                    children: [
                      Text(
                        'New to this app?',
                        style: subTitle,
                      ),
                      TextButton(
                        onPressed: () {
                          Map<String, dynamic> formData = {};
                          formData['username'] = emailController.text;
                          formData['password'] = passwordController.text;
                          pushRegister(context);
                        },
                        child: const Text(
                          'Sign Up', 
                          style: TextStyle(decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(205, 205, 144, 3), fontSize: 17, color: Color.fromARGB(205, 205, 144, 3),),
                        )
                      ),
                    ],
                  ),
              ),
              inputForm((p0){
                if(p0 == null || p0.isEmpty){
                  return "username tidak boleh kosong";
                }
                return null;
              },
                controller: emailController,
                hintTxt: "Email"),
              
              SizedBox(
                height: 25,
              ),

              inputFormPassword((p0){
                if(p0 == null || p0.isEmpty){
                  return "password kosong";
                }
                return null;
              },
                password: true,
                controller: passwordController,
                hintTxt: "Password",
                iconData: Icons.remove_red_eye),

              SizedBox(
                height: 10,
              ),

              TextButton(
                onPressed: () {
                  Map<String, dynamic> formData = {};
                  formData['username'] = emailController.text;
                  formData['password'] = passwordController.text;
                  pushRegister(context);
                },
                child: const Text(
                  'Forgot Password', 
                  style: TextStyle(decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(205, 205, 144, 3),),
                )
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(kPrimaryColor), 
                      foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(Size(350, 50),),
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      
                    ),
                    onPressed: () {
                    if(_formKey.currentState!.validate()){
                      if(dataForm!['email'] == emailController.text && dataForm['password'] == passwordController.text){
          
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (_) => navigationBar(data: dataForm ,)) );
                      }else{
                        showDialog(context: context, builder: (_)=>AlertDialog(
                          title: const Text('Password Salah'),
                          content: TextButton(
                            onPressed: () => pushRegister(context), 
                            child: const Text('Daftar Disini !!!')),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'), 
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'), 
                                child: const Text('OK'),
                              ),
                            ],
                          ),);
                      }
                    }
                  }, 
                  child: const Text('Log In')),
                ],
              ),

              SizedBox(
                height: 25,
              ),

              Text('Or Log in With:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              const LoginOption(),              

            ],
          ),
        ),
      ),
    );
  }
  void pushRegister(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterView(),),);
  }
}