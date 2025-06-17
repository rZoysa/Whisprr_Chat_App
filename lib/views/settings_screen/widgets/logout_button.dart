import 'package:flutter/material.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/utils/snackbar_util.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';
import 'package:whisprr/views/landing_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.authViewmodel});

  final AuthViewmodel authViewmodel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        //Logout button
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
            Color.fromARGB(255, 221, 225, 233),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
