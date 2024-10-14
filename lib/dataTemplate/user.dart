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
      } => User(
        fname: fname,
        lname: lname,
        username: username,
        phoneNum: phoneNum,
        email: email,
        password: password,
      ), _ => throw Exception('Invalid User JSON')
    };
  }
}

Future<User> createUser(
    String firstName,
    String lastName,
    String username,
    String phoneNum,
    String email,
    String unhashedPassword) async {
  final response = await http.put(
    Uri.parse('https://127.0.0.01:8000/user/create'),
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
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
