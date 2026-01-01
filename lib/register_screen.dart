// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'widgets/buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;
  final inUsernameController = TextEditingController();
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
            /// Logo
            FlutterLogo(
              size: 140,
              style: FlutterLogoStyle.horizontal,
            ),

            /// Title
            Text(
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 24),

            /// Username Field
            TextField(
              controller: inUsernameController,
              decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),

            /// Email Field
            TextField(
              controller: inEmailController,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),

            /// Password Field
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

            /// Button Register
            PrimaryButton(
              label: "REGISTER",
              onPressed: () async {
                /// validation check
                if (inUsernameController.text.isEmpty ||
                    inEmailController.text.isEmpty ||
                    inPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Semua kolom harus diisi"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                /// register to firebase
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: inEmailController.text,
                  password: inPasswordController.text,
                );

                /// navigate to profile screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen(
                      email: inEmailController.text,
                      username: inUsernameController.text,
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
                Navigator.pop(context);
              },
              child: Text("Sudah punya akun? Login disini"),
            ),
          ],
        ),
      ),
    );
  }
}
