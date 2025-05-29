import 'package:flutter/material.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/views/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0070FC),
      appBar: AppBar(
        backgroundColor: Color(0xff0070FC),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () {
                Customnavigation.nextMaterialPageReplace(
                  context,
                  RegisterScreen(),
                );
              },
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(),
    );
  }
}
