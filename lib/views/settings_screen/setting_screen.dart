import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';
import 'package:whisprr/views/settings_screen/widgets/logout_button.dart';

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
          LogoutButton(authViewmodel: authViewmodel),
        ],
      ),
    );
  }
}
