import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  _AccountInformationScreenState createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String username = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  // Load username and fetch user data
  Future<void> _initializeUser() async {
    String? storedUsername = await _storage.read(key: 'username');
    if (storedUsername != null) {
      setState(() {
        username = storedUsername;
      });
      await _fetchUserData();
    }
  }

  // Fetch user data from API
  Future<void> _fetchUserData() async {
    final url = Uri.parse('http://127.0.0.1:8000/user/$username');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        setState(() {
          firstNameController.text = userData['fname'] ?? '';
          lastNameController.text = userData['lname'] ?? '';
          emailController.text = userData['email'] ?? '';
          phoneController.text = userData['phoneNum'] ?? '';
          isLoading = false;
        });
      } else {
        _showSnackBar('Failed to load user data');
      }
    } catch (e) {
      _showSnackBar('Error fetching user data: $e');
    }
  }

  // Update user information
  Future<void> _updateUserData() async {
    final url = Uri.parse('http://127.0.0.1:8000/user/$username');

    final updatedData = {
      "fname": firstNameController.text,
      "lname": lastNameController.text,
      "email": emailController.text,
      "phoneNum": phoneController.text,
    };

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedData),
      );

      if (response.statusCode == 200) {
        _showSnackBar('Account information updated successfully!');
      } else {
        _showSnackBar('Failed to update user data');
      }
    } catch (e) {
      _showSnackBar('Error updating user data: $e');
    }
  }

  // Helper function to show SnackBar messages
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
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
