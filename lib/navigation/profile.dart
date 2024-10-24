import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:lifttrack/profile/ainfo.dart';
import 'package:lifttrack/profile/changepass.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

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
        title: Text('PROFILE', style: TextStyle(color: Colors.white)), // White text
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 3,
        automaticallyImplyLeading: false, // Remove the back button
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Wrap the body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              ProfileHeader(_image, _uploadImage),
              const SizedBox(height: 20),
              ProfileInfo(),
              const SizedBox(height: 80),
              ProfileButtons(),
              const SizedBox(height: 40), // Add some space before the logout button
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

  ProfileHeader(this._image, this._uploadImage);

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
                    : Icon(Icons.person, size: 50, color: Colors.white), // White icon
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD32F2F), // Dark red background
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.edit, size: 15, color: Colors.white), // White icon
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Name', style: TextStyle(fontSize: 20, color: Colors.black)), // Black text
        const Text('Username', style: TextStyle(fontSize: 16, color: Colors.black)), // Black text
      ],
    );
  }
}

class ProfileButtons extends StatelessWidget {
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountInfoPage()),
                );
              },
            ),
            ProfileButton(
              icon: Icons.lock,
              text: 'Change your password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
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
              onTap: () {
                // Add logic for navigating to App instructions
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap; // Add an onTap function

  ProfileButton({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
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
            Icon(icon, size: 40, color: Colors.white), // White icon
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white), // White text
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
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