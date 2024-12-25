import 'package:flutter/material.dart';
import '../utils/local_storage.dart';
import '../utils/validation.dart';

class LoginController {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    // Validasi input
    String? idError =
        Validation.validateNotEmpty(idController.text, 'IDLibrary');
    String? passwordError =
        Validation.validateNotEmpty(passwordController.text, 'Password');
    if (idError != null || passwordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(idError ?? passwordError!)),
      );
      return;
    }

    String? passwordValidationError =
        Validation.validatePassword(passwordController.text);
    if (passwordValidationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(passwordValidationError)),
      );
      return;
    }

    String? idNumericError =
        Validation.validateNumeric(idController.text, 'IDLibrary');
    if (idNumericError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(idNumericError)),
      );
      return;
    }

    // Cek apakah pengguna terdaftar
    final users = await LocalStorage.getUsers();
    final user = users.firstWhere(
      (u) =>
          u['idLibrary'] == idController.text &&
          u['password'] == passwordController.text,
      orElse: () => {},
    );

    if (user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('IDLibrary atau Password salah!')),
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
