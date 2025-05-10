import 'package:linkedin_clone/models/user_model.dart';

class AuthService {
  // Hardcodded user data for demonstration purposes
  final List<UserModel> _registeredUsers = [
    UserModel(email: "asa@gmail.com", password: "Otis1234")
  ];
  UserModel? _currentUser;

  Future<bool> signUp(String email, String password) async {
    // Check if the email is already registered
    if (_registeredUsers.any((user) => user.email == email)) {
      return false; // Email already exists
    }
    _registeredUsers.add(UserModel(email: email, password: password));
    _currentUser = UserModel(email: email, password: password);
    return true; // Sign-up successful
  }

  Future<bool> login(String email, String password) async {
    final user = _registeredUsers.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => UserModel(email: "", password: ""),
    );
    if (user.email.isNotEmpty) {
      _currentUser = user;
      return true;
    }
    return false;
  }

  UserModel? getCurrentUser() => _currentUser;
}
