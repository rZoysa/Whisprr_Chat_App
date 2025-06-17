import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:whisprr/components/custom_password_field.dart';
import 'package:whisprr/components/custom_text_field.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/views/auth_screens/login_screen/widgets/sign_in_button.dart';
import 'package:whisprr/views/auth_screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign in to continue the conversation.',
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
                                if (value == null || value.isEmpty) {
                                  return 'Email cannot be empty';
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
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: deviceWidth * 0.85,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 16),

                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: SignInButton(
                              formKey: _formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                          ),

                          SizedBox(height: 16),

                          SizedBox(
                            width: deviceWidth * 0.85,
                            child: ElevatedButton(
                              //Google Sign In button
                              onPressed: () {
                                Logger().d('Google Sign In');
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  245,
                                  245,
                                  245,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/google_logo.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  Text(
                                    'Continue with Google',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ],
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
