import 'package:chat/login_screen.dart';
import 'package:chat/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final String email;

  const ProfileScreen({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE"),
        actions: [
          Icon(Icons.edit),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                username.substring(0, 2).toUpperCase(),
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 24),

            /// Name
            Text(
              username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),

            /// Email
            Text(
              email,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),

            /// Button Logout
            SecondaryButton(
              label: "LOGOUT",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen(),
                  ),
                );
              },
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
