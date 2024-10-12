import 'dart:convert';
import 'package:lifttrack/dataTemplate/user_data.dart';
import 'package:firebase_database/firebase_database.dart';

class RTDBHelper {
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref('users/?id').child('users');

  // Method to add data
  Future<void> addUser(User user) async {
    final newUser = _userRef.push();
    await newUser.set(jsonEncode(user));
  }

  // Method to update data
  Future<void> updateUser(String key, dynamic value) async {
    await _userRef.child(key).update(value);
  }

  // Method to delete data
  Future<void> deleteUser(String key) async {
    await _userRef.child(key).remove();
  }

  // Method to get data
  Future<User> getUser(String id) async {
    final snapshot = await _userRef.child(id).once();
    final user = jsonDecode(snapshot as String) as Map<String, dynamic>;
    return User.fromJson(user);
  }
}
