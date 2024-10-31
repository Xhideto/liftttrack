import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  _AccountInformationScreenState createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Map<String, dynamic> userData = {}; // Store user data

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // Fetch user data from API
  Future<void> _fetchUserData() async {
    final username = 'exampleUser'; // Replace with the dynamic username
    final url = Uri.parse('http://127.0.0.1:8000/user/$username');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body);
          firstNameController.text = userData['fname'] ?? '';
          lastNameController.text = userData['lname'] ?? '';
          emailController.text = userData['email'] ?? '';
          phoneController.text = userData['phoneNum'] ?? '';
        });
      } else {
        print('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Update user information
  Future<void> _updateUserData() async {
    final username = 'exampleUser'; // Replace with the dynamic username
    final url = Uri.parse('http://127.0.0.1:8000/user/$username');

    final updatedData = {
      "fname": firstNameController.text,
      "lname": lastNameController.text,
      "email": emailController.text,
      "phoneNum": phoneController.text,
      // Add other fields if necessary
    };

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account information updated successfully!')),
        );
      } else {
        print('Failed to update user data');
      }
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _updateUserData,
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
