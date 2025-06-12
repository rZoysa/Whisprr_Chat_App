import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewmodel = Provider.of<AuthViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              authViewmodel.logout(context);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Color(0xffE8EDF5),
              ),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
