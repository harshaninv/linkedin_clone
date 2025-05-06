import 'package:linkedin_clone/models/user_model.dart';

class AuthService {
  UserModel? _currentUser;

  Future<bool> signUp(String email, String password) async {
    if (password.length >= 8) {
      _currentUser = UserModel(email: email, password: password);
      return true;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    if (_currentUser?.email == email && _currentUser?.password == password) {
      return true;
    }
    return false;
  }

  UserModel? getCurrentUser() => _currentUser;
}
