import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text('Name', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Account Settings'),
              ),
            ),
            SizedBox(height: 32),
            Text('Bio', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your bio',
              ),
            ),
            SizedBox(height: 16),
            Text('Email', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
