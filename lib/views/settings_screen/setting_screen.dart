import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/utils/snackbar_util.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';
import 'package:whisprr/views/landing_screen.dart';

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
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Log out of your account?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop(); // Close the dialog

                          // Logout the user
                          AuthResult result = await authViewmodel.logout();

                          if (!context.mounted) return;

                          if (result.success) {
                            //Show success message
                            SnackbarUtil.showSuccess(
                              context,
                              result.message,
                              duration: Duration(milliseconds: 1200),
                            );

                            // Navigate to the landing screen
                            Customnavigation.nextMaterialPageReplaceAll(
                              context,
                              LandingScreen(),
                            );
                          } else {
                            //Show error message
                            SnackbarUtil.showError(context, result.message);
                          }
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
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
