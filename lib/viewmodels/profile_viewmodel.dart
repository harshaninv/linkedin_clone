import 'package:flutter/material.dart';

class ProfileViewmodel extends ChangeNotifier {
  Map<String, dynamic>? _profile;

  Map<String, dynamic>? get profile => _profile;

  void fetchProfile(){
    _profile = {
      'name': 'John Doe',
      'headline': 'Software Engineer at LinkedIn',
      'location': 'San Francisco, CA',
      'connections': 500,
      'about': 'Passionate about technology and innovation.',
      'skills': ['Flutter', 'Dart', 'Firebase'],
    };
    notifyListeners();
  }
}
