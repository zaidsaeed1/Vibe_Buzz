import 'package:flutter/material.dart';
import 'package:vibe_buzz1/loginscreen.dart';

void main() {
  runApp(const VibeBuzzApp());
}

class VibeBuzzApp extends StatelessWidget {
  const VibeBuzzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibe Buzz',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.tealAccent,
        colorScheme: const ColorScheme.dark(
          primary: Colors.tealAccent,
          secondary: Colors.cyanAccent,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
