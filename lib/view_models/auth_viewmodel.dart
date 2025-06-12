import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:whisprr/Services/auth_service.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final Logger _logger = Logger();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> signUp(String email, String password, String username) async {
    // Sign Up Method
    _setLoading(true);
    try {
      await _authService.signUp(email, password, username);
    } catch (e) {
      _setError(e.toString());
      _logger.e("Sign Up Error: $e");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> login(String email, String password) async {
    // Login Method
    _setLoading(true);
    try {
      await _authService.login(email, password);
      _logger.f("Login successful for user: ${_authService.currentUser?.email}");
    } catch (e) {
      _setError(e.toString());
      _logger.e("Login Error: $e");
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
