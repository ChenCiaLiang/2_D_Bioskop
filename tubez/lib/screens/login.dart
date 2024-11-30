import 'package:flutter/material.dart';
import 'package:tubez/screens/register.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/login_options.dart';
import 'package:tubez/widgets/navigation.dart';
import 'package:tubez/component/form_component.dart';
import 'package:tubez/screens/profile.dart';
import 'package:tubez/client/UserClient.dart';

class LoginScreen extends StatefulWidget {
  final Map? data;

  const LoginScreen({super.key, this.data});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


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
                child: Row(
                  children: [
                    Text(
                      'New to this app?',
                      style: greyText,
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
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(205, 205, 144, 3),
                            fontSize: 17,
                            color: Color.fromARGB(205, 205, 144, 3),
                          ),
                        )),
                  ],
                ),
              ),
              inputForm((p0) {
                if (p0 == null || p0.isEmpty) {
                  return "username tidak boleh kosong";
                }
                return null;
              }, controller: emailController, hintTxt: "Email"),

              const SizedBox(
                height: 25,
              ),
              
              Padding(
                padding: kDefaultPadding,
                child: SizedBox(
                  width: 350,
                  child : TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: isObscure ?
                          Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          color: kTextFieldColor,
                      ),
                    ),
                  )
                ),
              ),
              const SizedBox(
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
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 179, 157, 219),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(kPrimaryColor),
                        foregroundColor:
                            WidgetStatePropertyAll<Color>(Colors.white),
                        fixedSize: WidgetStateProperty.all<Size>(
                          const Size(350, 50),
                        ),
                        textStyle: WidgetStateProperty.all<TextStyle>(
                            const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      onPressed: () async{
                          try{
                            bool response = await UserClient.login(emailController.text, passwordController.text);
                              if (response) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => const navigationBar()),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('Password Salah'),
                                    content: TextButton(
                                        onPressed: () => pushRegister(context),
                                        child: const Text('Daftar Disini !!!')),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          }catch(e){
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Error'),
                                content: TextButton(
                                    onPressed: () => pushRegister(context),
                                    child: const Text('Samting wong')),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        
                      },
                    child: const Text('Log In')),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Or Log in With:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              const LoginOption(),
            ],
          ),
        ),
      ),
    );
  }

  void pushRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RegisterView(),
      ),
    );
  }
}
