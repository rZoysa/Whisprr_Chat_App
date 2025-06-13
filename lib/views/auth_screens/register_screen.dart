import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisprr/components/custom_password_field.dart';
import 'package:whisprr/components/custom_text_field.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/utils/snackbar_util.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';
import 'package:whisprr/views/auth_screens/login_screen.dart';
import 'package:whisprr/views/home_screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final authViewmodel = Provider.of<AuthViewmodel>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap
      },
      child: Scaffold(
        backgroundColor: Color(0xff0070FC),
        appBar: AppBar(
          backgroundColor: Color(0xff0070FC),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: () {
                  Customnavigation.nextMaterialPageReplace(
                    context,
                    LoginScreen(),
                  );
                },
                child: Text(
                  'Sign In',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Create your account and start chatting.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          SizedBox(height: 32),
                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: CustomTextField(
                              //Email field
                              label: 'Email',
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('@')) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: CustomTextField(
                              //Email field
                              label: 'Username',
                              controller: usernameController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: CustomPasswordField(
                              //Password field
                              label: 'Password',
                              textInputAction: TextInputAction.next,
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: 16),

                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: CustomPasswordField(
                              //Password field
                              label: 'Confirm Password',
                              controller: confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm Password cannot be empty';
                                }
                                if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: 30),

                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: TextButton(
                              //Sign In button
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff0070FC),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  AuthResult result = await authViewmodel
                                      .signUp(
                                        emailController.text.trim(),
                                        passwordController.text,
                                        usernameController.text,
                                      );

                                  if (!context.mounted) return;

                                  if (result.success) {
                                    //Show success message
                                    SnackbarUtil.showSuccess(
                                      context,
                                      result.message,
                                    );

                                    // Navigate to Home Screen on successful Sign Up
                                    Customnavigation.nextMaterialPageReplaceAll(
                                      context,
                                      HomeScreen(),
                                    );
                                  } else {
                                    // Show error message
                                    SnackbarUtil.showError(
                                      context,
                                      result.message,
                                    );
                                  }
                                }
                              },
                              child: authViewmodel.isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Register',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
