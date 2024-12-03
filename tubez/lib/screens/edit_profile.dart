import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/service/camera.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final String username;
  final String email;
  final String noTelp;
  final String dateBirth;
  final String password;

  const EditProfileScreen({
    super.key,
    required this.username,
    required this.email,
    required this.noTelp,
    required this.dateBirth,
    required this.password,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController controllerUsername;
  late TextEditingController controllerEmail;
  late TextEditingController controllerTelp;
  late TextEditingController controllerDateBirth;
  late TextEditingController controllerPassword;
  late TextEditingController controllerConfirm;

  @override
  void initState() {
    super.initState();
    controllerUsername = TextEditingController(text: widget.username);
    controllerEmail = TextEditingController(text: widget.email);
    controllerTelp = TextEditingController(text: widget.noTelp);
    controllerDateBirth = TextEditingController(text: widget.dateBirth);
    controllerPassword = TextEditingController();
    controllerConfirm = TextEditingController();
  }

  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _chooseProfileImage() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Sumber Gambar'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, ImageSource.camera); // Camera
              },
              child: const Text('Kamera'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery); // Gallery
              },
              child: const Text('Galeri'),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(36, 158, 158, 158),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
        ),
        leadingWidth: 80,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Edit Profile',
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
                    onTap: _chooseProfileImage, // Use the new function here
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: const Color.fromARGB(205, 205, 144, 3),
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
                label: "DATE OF BIRTH", controller: controllerDateBirth),
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
                if (controllerPassword.text != controllerConfirm.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords do not match!")),
                  );
                  return;
                }

                String updatedUsername = controllerUsername.text;
                String updatedEmail = controllerEmail.text;
                String updatedNoTelp = controllerTelp.text;
                String updatedDateBirth = controllerDateBirth.text;
                String updatedPassword = controllerPassword.text;

                Navigator.pop(context, {
                  'username': updatedUsername,
                  'Email': updatedEmail,
                  'noTelp': updatedNoTelp,
                  'dateBirth': updatedDateBirth,
                  'password': updatedPassword,
                });
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
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
