import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/screens/login.dart';
import 'package:tubez/screens/edit_profile.dart';
import 'dart:io';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  // final bool _isEditing = false;
  String _name = 'Agus Zefanto';
  String _email = 'agoes@gmail.com';
  String _noTelp = '0821234567890';
  String _dateBirth = '18/08/2004';
  String _password = 'Ze*****18';

  File? _profileImage;

  void updateProfile(Map<String, String> updatedData) {
    setState(() {
      _name = updatedData['username']!;
      _email = updatedData['email']!;
      _noTelp = updatedData['noTelp']!;
      _dateBirth = updatedData['dateBirth']!;
      _password = updatedData['password']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 35, 35, 35),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
        ),
        leadingWidth: 80,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'My Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(205, 205, 144, 3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(36, 158, 158, 158),
                radius: 25,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : const AssetImage("assets/images/download.png")
                              as ImageProvider,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          _noTelp,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 111, 111, 111)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PROFILE',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final updatedData = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            username: _name,
                            email: _email,
                            noTelp: _noTelp,
                            dateBirth: _dateBirth,
                            password: _password,
                          ),
                        ),
                      );

                      if (updatedData != null) {
                        updateProfile(updatedData);
                      }
                    },
                    child: const Text(
                      'EDIT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(205, 205, 144, 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(104, 178, 178, 178),
            ),
            const SizedBox(height: 20),
            _buildProfileInfo("Username", _name),
            _buildProfileInfo("Email", _email),
            _buildProfileInfo("Nomor Telepon", _noTelp),
            _buildProfileInfo("Tanggal Lahir", _dateBirth),
            _buildProfileInfo("Password", _password),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Log Out",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
