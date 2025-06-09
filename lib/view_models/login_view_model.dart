import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginViewModel extends ChangeNotifier {
  final Logger _logger = Logger();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    // Simulate a login delay
    Future.delayed(Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();

      _logger.i("User logged in: $email");
      //navigation logic
    });
  }
}
