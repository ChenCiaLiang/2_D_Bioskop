import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController controllerUsername =
      TextEditingController(text: 'Agus Zefanto');
  TextEditingController controllerEmail =
      TextEditingController(text: 'agoes@gmail.com');
  TextEditingController controllerTelp =
      TextEditingController(text: '0821234567890');
  TextEditingController controllerTanggal =
      TextEditingController(text: '18/08/2004');
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirm = TextEditingController();

  File? _profileImage;

  Future<void> _changeProfileImage() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 205, 3),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : const AssetImage("assets/images/download.png")
                          as ImageProvider,
                  backgroundColor: Colors.grey,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _changeProfileImage,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.yellow,
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField(label: "NAME", controller: controllerUsername),
            const SizedBox(height: 15),
            _buildTextField(label: "E-MAIL", controller: controllerEmail),
            const SizedBox(height: 13),
            _buildTextField(label: "MOBILE NUMBER", controller: controllerTelp),
            const SizedBox(height: 10),
            _buildTextField(
                label: "DATE OF BIRTH", controller: controllerTanggal),
            const SizedBox(height: 20),
            _buildTextField(
                label: "PASSWORD",
                controller: controllerPassword,
                obscureText: true),
            const SizedBox(height: 20),
            _buildTextField(
                label: "CONFIRM PASSWORD",
                controller: controllerConfirm,
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save profile changes logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                "SAVE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
