import 'package:flutter/material.dart';
import '../dataTemplate/user.dart'; // Import the User class and createUser function

class SignUpScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: contactNumberController,
                    decoration: InputDecoration(labelText: 'Contact Number'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (passwordController.text == confirmPasswordController.text) {
                        try {
                          await createUser(
                            firstNameController.text,
                            lastNameController.text,
                            usernameController.text,
                            contactNumberController.text,
                            emailController.text,
                            passwordController.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User created successfully!')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to create user.')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Passwords do not match.')),
                        );
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}