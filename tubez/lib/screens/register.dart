import 'package:flutter/material.dart';
import 'package:tubez/screens/login.dart';
import 'package:tubez/component/form_component.dart';
import 'package:tubez/theme.dart';
import 'package:tubez/widgets/checkbox.dart';
import 'package:tubez/screens/profile.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              
              Padding(
                padding: kDefaultPadding,
                child: Text(
                  'Create Account',
                  style: titleText,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: kDefaultPadding,
                child: 
                  Row(
                    children: [
                      Text(
                        'Already a member?',
                        style: subTitle,
                      ),
                      TextButton(
                        onPressed: () {
                          pushLogin(context);
                        },
                        child: const Text(
                          'Log In', 
                          style: TextStyle(decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(205, 205, 144, 3), fontSize: 17, color: Color.fromARGB(205, 205, 144, 3),),
                        )
                      ),
                    ],
                  ),
              ),

              SizedBox(
                height: 15,
              ),

              inputForm(
                (p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'First Name tidak boleh kosong';
                  }
                  return null;
                },
                  controller: firstNameController,
                  hintTxt: "First Name",),
              
              SizedBox(
                height: 15,
              ),

              inputForm(
                (p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'Last Name tidak boleh kosong';
                  }
                  return null;
                },
                  controller: lastNameController,
                  hintTxt: "Last Name",),

              SizedBox(
                height: 15,
              ),
              
              inputForm(
                (p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'Date Birth tidak boleh kosong';
                  }
                  return null;
                },
                  controller: dateBirthController,
                  hintTxt: "Date Birth",),
              
              SizedBox(
                height: 15,
              ),

              inputForm(
                ((p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'Email tidak boleh kosong';
                  }
                  if(!p0.contains('@')){
                    return 'Email harus menggunakan @';
                  }
                  return null;
                }),
                  controller: emailController,
                  hintTxt: "Email",),

              SizedBox(
                height: 15,
              ),

              inputForm(
                ((p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'Nomor HP tidak boleh kosong';
                  }
                  return null;
                }),
                  controller: phoneController,
                  hintTxt: "phone",),

              SizedBox(
                height: 15,
              ),

              inputFormPassword(
                ((p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'Password tidak boleh kosong';
                  }
                  if(p0.length<5){
                    return 'Password minimal 5 digit';
                  }
                  return null;
                }),
                  password: true,
                  controller: passwordController,
                  hintTxt: "Password",
                  iconData: Icons.remove_red_eye),
              
              SizedBox(
                height: 15,
              ),

              inputFormPassword(
                ((p0) {
                  if(p0 == null || p0.isEmpty){
                    return 'Confirm Password tidak boleh kosong';
                  }
                  if(passwordController.text != p0){
                    return 'Password Tidak Sesuai';
                  }
                  return null;
                }),
                password: true,
                controller: confirmPasswordController,
                hintTxt: "Confirm Password",
                iconData: Icons.remove_red_eye),
              
              SizedBox(
                height: 25,
              ),

              const Padding(
                padding: kDefaultPadding,
                child: CheckBox('I have Agree to Terms and Conditions.'),
              ),

              SizedBox(
                height: 20,
              ),
              
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(kPrimaryColor), 
                  foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                  fixedSize: MaterialStateProperty.all<Size>(Size(350, 50),),
                  textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    final Map<String,dynamic> formData = {};
                    formData['email'] = emailController.text;
                    formData['password'] = passwordController.text;
                    formData['phone'] = phoneController.text;
                    formData['first name'] = firstNameController.text;
                    formData['last name'] = lastNameController.text;
                    formData['date birth'] = dateBirthController.text;
                    
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen(data: formData,)) );
                  }
                }, 
                child: const Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
  void pushLogin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen(),),);
  }
}