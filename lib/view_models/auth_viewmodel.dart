import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:whisprr/Services/auth_service.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Sign Up Method
  Future<AuthResult> signUp(
    String email,
    String password,
    String username,
  ) async {
    _setLoading(true);
    try {
      await _authService.signUp(email, password, username); //

      return AuthResult(success: true, message: 'Successfully Registered and verification email sent!');
    } on FirebaseAuthException catch (e) {
      // Logger().e("Sign Up Error: $e");

      return AuthResult(success: false, message: getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  // Login Method
  Future<AuthResult> login(String email, String password) async {
    _setLoading(true);
    try {
      await _authService.login(email, password);

      //Chek if the user email is verified
      bool isEmailVerified = await _authService.checkIsUserEmailVerified();
      if (_authService.currentUser != null && !isEmailVerified) {
        return AuthResult(
          success: false,
          errorCode: 'email-not-verified',
          message: 'Please verify your email before logging in.',
        );
      }

      return AuthResult(success: true, message: 'Login successful!');
    } on FirebaseAuthException catch (e) {
      // Logger().e(getErrorMessage(e.code));

      return AuthResult(success: false, message: getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  // Method to send the email verification
  Future<void> sendEmailVerification() async {
    try {
      _authService.sendVerifyEmail();
    } catch (e) {
      Logger().e("Email Verification Error: $e");
    }
  }

  // Logout Method
  Future<AuthResult> logout() async {
    _setLoading(true);
    try {
      await _authService.logout();
      // Logger().f("User logged out successfully");

      return AuthResult(success: true, message: 'Logged out successfully!');
    } catch (e) {
      // Logger().e("Logout Error: $e");

      return AuthResult(
        success: false,
        message: 'An error occurred while logging out.',
      );
    } finally {
      _setLoading(false);
    }
  }

  //Set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Returns a user-friendly error message based on the Firebase error code.
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

// This class represents the result of an authentication operation
class AuthResult {
  final bool success;
  final String? errorCode;
  final String message;

  AuthResult({required this.success, this.errorCode, required this.message});
}
