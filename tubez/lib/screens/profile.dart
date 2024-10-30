import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubez/screens/login.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final bool _isEditing = false;
  String _name = 'Agus Zefanto';
  String _email = 'Agoes@gmail.com';
  String _noTelp = '0821234567890';
  String _dateBirth = '18/08/2004';
  String _password = 'Ze*****18';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(FontAwesomeIcons.arrowLeftLong,
              color: Color.fromARGB(205, 205, 144, 3)),
        ),
        leadingWidth: 80,
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromARGB(205, 205, 144, 3)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              color: Color.fromARGB(104, 178, 178, 178),
            ),
            const SizedBox(
              height: 20,
            ),
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
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("images/download.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Agus Zefanto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '+62 0812 6667 6969',
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
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(104, 178, 178, 178),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildProfileInfo("Username", _name, _isEditing, (value) {
              setState(() {
                _name = value;
              });
            }),
            _buildProfileInfo("Email", _email, _isEditing, (value) {
              setState(() {
                _email = value;
              });
            }),
            _buildProfileInfo("Nomor Telepon", _noTelp, _isEditing, (value) {
              setState(() {
                _noTelp = value;
              });
            }),
            _buildProfileInfo("Tanggal Lahir", _dateBirth, _isEditing, (value) {
              setState(() {
                _dateBirth = value;
              });
            }),
            _buildProfileInfo("Password", _password, _isEditing, (value) {
              setState(() {
                _password = value;
              });
            }),
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

  Widget _buildProfileInfo(
      String label, String value, bool isEditing, Function(String) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
          isEditing
              ? TextField(
                  controller: TextEditingController(text: value),
                  onChanged: onChanged,
                  style: const TextStyle(fontSize: 16),
                )
              : Text(value,
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
        ],
      ),
    );
  }
}
