import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';

class ProfileViewmodel extends ChangeNotifier {
  Map<String, dynamic>? _profile;
  bool _isLoading = false;

  Map<String, dynamic>? get profile => _profile;
  bool get isLoading => _isLoading;

  Future<void> fetchProfile() async{
    _isLoading = true;
    notifyListeners();
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    _profile = {
      'name': 'Asa Butterfield',
      'profileImage': Constants.profileImage1,
      'headline': 'Software Engineer | Flutter Developer | Tech Enthusiast',
      'description': 'Talks about #flutter, #dart, #firebase, #filament, #laravel',
      'location': 'San Francisco, CA',
      'connections': 500,
      'about': 'Passionate about technology and innovation.',
      'skills': ['Flutter', 'Dart', 'Firebase'],
      'followers': 4413,
      'OpenToWorkRoles': 'Software Engineer, Flutter Developer',
      'viewCount': 111,
      'postViewCount': 500,
      'searchAppearances': 85,
    };
    _isLoading = false;
    notifyListeners();
  }
}
