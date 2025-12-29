import 'package:chat/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Apps',
      theme: ThemeData(
        primaryColor: Colors.pink,
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
