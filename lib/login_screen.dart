import 'package:chat/profile_screen.dart';
import 'package:chat/register_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  final inEmailController = TextEditingController();
  final inPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 140,
              style: FlutterLogoStyle.horizontal,
            ),
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextField(
              controller: inEmailController,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: inPasswordController,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: hidePassword,
            ),
            SizedBox(height: 24),
            PrimaryButton(
              label: "LOGIN",
              onPressed: () {
                if (inEmailController.text.isEmpty ||
                    inPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Semua kolom harus diisi"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen(
                      email: inEmailController.text,
                      username: inEmailController.text,
                    ),
                  ),
                );
              },
            ),
            Divider(
              height: 48,
              color: Colors.grey.shade300,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const RegisterScreen(),
                  ),
                );
              },
              child: Text("Belum punya akun? Daftar disini"),
            ),
          ],
        ),
      ),
    );
  }
}
