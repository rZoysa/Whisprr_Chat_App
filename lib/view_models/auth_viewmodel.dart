import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whisprr/Services/auth_service.dart';
import 'package:whisprr/utils/navigation/custom_navigation.dart';
import 'package:whisprr/utils/snackbar_util.dart';
import 'package:whisprr/views/home_screen/home_screen.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Sign Up Method
  Future<void> signUp(
    BuildContext context,
    String email,
    String password,
    String username,
  ) async {
    _setLoading(true);
    try {
      await _authService.signUp(email, password, username);

      if (!context.mounted) return;

      //Show success message
      SnackbarUtil.showSuccess(context, 'Successfully Registered!');

      // Navigate to Home Screen on successful Sign Up
      Customnavigation.nextMaterialPageReplaceAll(context, HomeScreen());
    } on FirebaseAuthException catch (e) {
      // Logger().e("Sign Up Error: $e");

      // Show error message
      SnackbarUtil.showError(context, getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  // Login Method
  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    _setLoading(true);
    try {
      await _authService.login(email, password);
      // Logger().f("Login successful for user: ${_authService.currentUser?.email}");

      if (!context.mounted) return;

      //Show success message
      SnackbarUtil.showSuccess(context, 'Login successful!');

      // Navigate to Home Screen on successful login
      Customnavigation.nextMaterialPageReplaceAll(context, HomeScreen());
    } on FirebaseAuthException catch (e) {
      // Logger().e(getErrorMessage(e.code));

      // Show error message
      SnackbarUtil.showError(context, getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout(BuildContext context) async {
    _setLoading(true);
    try {
      await _authService.logout();
      // Logger().f("User logged out successfully");

      if (!context.mounted) return;

      //Show success message
      SnackbarUtil.showSuccess(context, 'Logged out successfully!');
    } catch (e) {
      // Logger().e("Logout Error: $e");
      SnackbarUtil.showError(context, 'An error occurred while logging out.');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'invalid-credential':
        return 'Invalid credentials';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email is already registered. Please login.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Try a stronger one.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
