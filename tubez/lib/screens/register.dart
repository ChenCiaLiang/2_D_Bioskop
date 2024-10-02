import 'package:flutter/material.dart';
import 'package:tubez/screens/login.dart';
import 'package:tubez/theme.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // inputForm(
              //   (p0) {
              //     if(p0 == null || p0.isEmpty){
              //       return 'Username tidak boleh kosong';
              //     }
              //     if(p0.toLowerCase() == 'anjing'){
              //       return 'Tidak boleh menggunakan kata kasar';
              //     }
              //     return null;
              //   },
              //     controller: usernameController,
              //     hintTxt: "Username",
              //     helperTxt: "Ucup Surucup",
              //     iconData: Icons.person),

              // inputForm(
              //   ((p0) {
              //     if(p0 == null || p0.isEmpty){
              //       return 'Email tidak boleh kosong';
              //     }
              //     if(!p0.contains('@')){
              //       return 'Email harus menggunakan @';
              //     }
              //     return null;
              //   }),
              //     controller: emailController,
              //     hintTxt: "Email",
              //     helperTxt: "ucup@gmail.com",
              //     iconData: Icons.email),

              // inputForm(
              //   ((p0) {
              //     if(p0 == null || p0.isEmpty){
              //       return 'Password tidak boleh kosong';
              //     }
              //     if(p0.length<5){
              //       return 'Password minimal 5 digit';
              //     }
              //     return null;
              //   }),
              //     controller: passwordController,
              //     hintTxt: "Password",
              //     helperTxt: "xxxxxxx",
              //     iconData: Icons.password,
              //     password: true),

              // inputForm(
              //   ((p0) {
              //     if(p0 == null || p0.isEmpty){
              //       return 'Nomor Telepon Tidak boleh kosong';
              //     }
              //     return null;
              //   }),
              //     controller: notelpController,
              //     hintTxt: "No Telp",
              //     helperTxt: "08123456789",
              //     iconData: Icons.phone_android),

              // ElevatedButton(
              //   onPressed: () {
              //     if(_formKey.currentState!.validate()){
              //       Map<String,dynamic> formData = {};
              //       formData['username'] = usernameController.text;
              //       formData['password'] = passwordController.text;
              //       Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView(data: formData ,)) );
              //     }
              //   },
              //   child: const Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
