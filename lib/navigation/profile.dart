import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.blue[900]),
            ),
            SizedBox(height: 10),
            Text('Name', style: TextStyle(fontSize: 20)),
            Text('Username', style: TextStyle(fontSize: 16)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileButton(text: 'Account Information'),
            ProfileButton(text: 'Change your password'),
            ProfileButton(text: 'App instructions'),
            ProfileButton(text: 'Log Out'),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;

  ProfileButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue[900], backgroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
