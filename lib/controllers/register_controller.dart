import 'package:flutter/material.dart';
import '../utils/local_storage.dart';
import '../utils/validation.dart';

class RegisterController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> register(BuildContext context) async {
    // Validasi input
    String? nameError =
        Validation.validateNotEmpty(nameController.text, 'Nama');
    String? idError =
        Validation.validateNotEmpty(idController.text, 'IDLibrary');
    String? emailError = Validation.validateEmail(emailController.text);
    String? passwordError =
        Validation.validatePassword(passwordController.text);

    if (nameError != null ||
        idError != null ||
        emailError != null ||
        passwordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(nameError ?? idError ?? emailError ?? passwordError!),
        ),
      );
      return;
    }

    // Simpan user baru ke local storage
    final newUser = {
      'idLibrary': idController.text,
      'name': nameController.text,
      'password': passwordController.text,
      'email': emailController.text,
      'phone': '',
      'level': 'Admin',
      'address': '',
    };

    final users = await LocalStorage.getUsers();
    users.add(newUser);
    await LocalStorage.saveUsers(users);

    Navigator.pushReplacementNamed(context, '/login');
  }
}
