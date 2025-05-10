import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/user_model.dart';
import 'package:linkedin_clone/services/auth_service.dart';
import 'package:linkedin_clone/utils/validator.dart';

class AuthViewmodel with ChangeNotifier {
  bool isLoading = false;
  bool isPasswordVisible = false;
  UserModel? loggedInUser;
  final AuthService _authService = AuthService();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    // Validate inputs
    final emailError = Validator.validateEmail(email);
    final passwordError = Validator.validatePassword(password);
    if (emailError != null || passwordError != null) {
      isLoading = false;
      notifyListeners();
      return false;
    }

    // Attempt login
    bool success = await _authService.login(email, password);
    if (success) {
      loggedInUser = _authService.getCurrentUser();
    }

    isLoading = false;
    notifyListeners();
    return success;
  }

  Future<bool> signUp(String email, String password) async {
    isLoading = true;
    notifyListeners();

    // Validate inputs
    final emailError = Validator.validateEmail(email);
    final passwordError = Validator.validatePassword(password);
    if (emailError != null || passwordError != null) {
      isLoading = false;
      notifyListeners();
      return false;
    }

    // Attempt signup
    bool success = await _authService.signUp(email, password);
    if (success) {
      loggedInUser = _authService.getCurrentUser();
    }

    isLoading = false;
    notifyListeners();
    return success;
  }
}