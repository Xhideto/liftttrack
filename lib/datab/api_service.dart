import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String _baseUrl = 'http://127.0.0.1:8000';
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> createUser(String username, String password) async {
    final url = Uri.parse('$_baseUrl/user/create');
    final response = await http.put(url, body: jsonEncode({'username': username, 'password': password}), headers: {'Content-Type': 'application/json'});
    return response.statusCode == 200;
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    final url = Uri.parse('$_baseUrl/user/$username');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<bool> updateUser(String username, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/user/$username');
    final response = await http.put(url, body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return response.statusCode == 200;
  }

  Future<bool> deleteUser(String username) async {
    final url = Uri.parse('$_baseUrl/user/$username');
    final response = await http.delete(url);
    return response.statusCode == 200;
  }

  Future<void> saveUserData(String username) async {
    await _storage.write(key: 'username', value: username);
  }

  Future<String?> getUserData() async {
    return await _storage.read(key: 'username');
  }

  Future<void> clearUserData() async {
    await _storage.deleteAll();
  }
}
