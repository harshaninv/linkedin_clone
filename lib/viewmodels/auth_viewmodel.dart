import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/user_model.dart';
import 'package:linkedin_clone/services/auth_service.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isloading = false;

  UserModel? get user => _user;
  bool get isLoading => _isloading;

  Future<bool> signUp(String email, String password) async {
    _isloading = true;
    notifyListeners();
    bool success = await _authService.signUp(email, password);
    if (success) {
      _user = _authService.getCurrentUser();
    }
    _isloading = false;
    notifyListeners();
    return success;
  }

  Future<bool> login(String email, String password) async {
    _isloading = true;
    notifyListeners();
    bool success = await _authService.login(email, password);
    if (success) {
      _user = _authService.getCurrentUser();
    }
    _isloading = false;
    notifyListeners();
    return success;
  }
}