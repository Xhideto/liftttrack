import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String fname;
  final String lname;
  final String username;
  final String phoneNum;
  final String email;
  final String password;

  const User({
    required this.fname,
    required this.lname,
    required this.username,
    required this.phoneNum,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'fname': String fname,
      'lname': String lname,
      'username': String username,
      'phoneNum': String phoneNum,
      'email': String email,
      'password': String password,
      } =>
          User(
            fname: fname,
            lname: lname,
            username: username,
            phoneNum: phoneNum,
            email: email,
            password: password,
          ),
      _ => throw Exception('Invalid User JSON')
    };
  }
}

Future<User> createUser(
    String firstName,
    String lastName,
    String username,
    String phoneNum,
    String email,
    String unhashedPassword,
    ) async {
  final client = http.Client();
  try {
    final response = await client.put(
      Uri.parse('http://127.0.0.1:8000'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'fname': firstName,
        'lname': lastName,
        'username': username,
        'phoneNum': phoneNum,
        'email': email,
        'password': unhashedPassword,
      }),
    ).timeout(Duration(seconds: 30)); // Set a 30-second timeout

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create user. Status code: ${response.statusCode}');
    }
  } on TimeoutException catch (_) {
    throw Exception('Connection timed out. Please check your internet connection and try again.');
  } catch (e) {
    throw Exception('An error occurred: $e');
  } finally {
    client.close();
  }
}