import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // User data placeholders; replace with actual data source
  String name = "John Doe";
  String username = "johndoe";

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        _image = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 3,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              ProfileHeader(_image, _uploadImage),
              const SizedBox(height: 20),
              ProfileInfo(name: name, username: username),
              const SizedBox(height: 80),
              ProfileButtons(),
              const SizedBox(height: 40),
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final File? _image;
  final Function _uploadImage;

  const ProfileHeader(this._image, this._uploadImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _uploadImage(),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFFFF7043),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.file(_image!, fit: BoxFit.cover),
                      )
                    : Icon(Icons.person, size: 50, color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD32F2F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.edit, size: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String name;
  final String username;

  const ProfileInfo({required this.name, required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          username,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileButton(
              icon: Icons.account_circle,
              text: 'Account Information',
              route: '/account_information',
            ),
            ProfileButton(
              icon: Icons.lock,
              text: 'Change your password',
              route: '/forget_password',
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileButton(
              icon: Icons.info,
              text: 'App instructions',
              route: '/app_instructions',
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const ProfileButton({
    required this.icon,
    required this.text,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.amber[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/main');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 18, color: Colors.black87),
            const SizedBox(width: 8),
            Text(
              'Log Out',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
