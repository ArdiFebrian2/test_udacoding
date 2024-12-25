import 'dart:convert'; // Tambahkan ini untuk jsonEncode dan jsonDecode
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveUsers(List<Map<String, dynamic>> users) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('users', jsonEncode(users));
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('users');
    if (data == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(data));
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
