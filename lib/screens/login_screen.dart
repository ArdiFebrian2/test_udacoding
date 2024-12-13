import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  final TextEditingController idLibraryController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(
      String idLibrary, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost/beckend/api.php?action=login'),
      body: {'idLibrary': idLibrary, 'password': password},
    );

    final data = jsonDecode(response.body);
    if (data['success']) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text(data['message'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/udc.jpg', height: 100),
            SizedBox(height: 20),
            TextField(
              controller: idLibraryController,
              decoration: InputDecoration(
                hintText: 'idLibrary',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final idLibrary = idLibraryController.text.trim();
                final password = passwordController.text.trim();
                login(idLibrary, password, context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Log in',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
