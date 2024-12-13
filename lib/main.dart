import 'package:flutter/material.dart';
import 'package:test_udacoding/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uda coding',
      home: LoginScreen(),
      theme: ThemeData(
        // Apply Poppins font globally
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
