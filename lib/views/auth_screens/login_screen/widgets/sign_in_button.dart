import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/utils/snackbar_util.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';
import 'package:whisprr/views/auth_screens/login_screen/widgets/email_status_sheet.dart';
import 'package:whisprr/views/home_screen/home_screen.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final authViewmodel = Provider.of<AuthViewmodel>(context);

    return TextButton(
      //Sign In button
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff0070FC),
        padding: const EdgeInsets.symmetric(vertical: 7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: authViewmodel.isLoading
          ? null
          : () async {
              if (_formKey.currentState!.validate()) {
                AuthResult result = await authViewmodel.login(
                  emailController.text.trim(),
                  passwordController.text,
                );

                if (!context.mounted) return;

                if (!result.success &&
                    result.errorCode == 'email-not-verified') {
                  // Show email verification error
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => EmailStatusSheet(
                      onResend: () async {
                        // Resend verification email
                        authViewmodel.sendEmailVerification();

                        Navigator.pop(context);

                        SnackbarUtil.showSuccess(
                          context,
                          'Verification email sent.',
                        );
                      },
                    ),
                  );
                  return;
                }

                if (result.success) {
                  //Show success message
                  SnackbarUtil.showSuccess(context, result.message);

                  // Navigate to Home Screen on successful login
                  Customnavigation.nextMaterialPageReplaceAll(
                    context,
                    HomeScreen(),
                  );
                } else {
                  // Show error message
                  SnackbarUtil.showError(context, result.message);
                }
              }
            },

      child: authViewmodel.isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
