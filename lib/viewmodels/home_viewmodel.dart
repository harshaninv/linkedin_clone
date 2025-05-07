import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/post_model.dart';

class HomeViewmodel extends ChangeNotifier {
  List<PostModel> _posts = [];
  List<Map<String, dynamic>> _stories = [];

  List<PostModel> get posts => _posts;
  List<Map<String, dynamic>> get stories => _stories;

  void fetchPosts() {
    _posts = [
      PostModel(
        userName: 'Tony Antonio',
        content: 'Creating opportunity for every member of the global workforce drives everything we do at Link...',
        timeAgo: '1w • Edited',
        connectionLevel: '2nd',
        jobTitle: 'Android Dev at i Labs',
        likes: 'Harshani and 97 others',
        comments: '77',
      ),
      PostModel(
        userName: 'Asa Butterfield',
        content: 'Excited to announce that I have joined the team at i Labs as Flutter Intern!. Thank you to everyone who has supported me on this journey. I am looking forward to this new chapter in my career!',
        timeAgo: '2d • Edited',
        connectionLevel: '1st',
        jobTitle: 'Software Engineer at i Labs',
        likes: 'Tharushi and 50 others',
        comments: '20',
      ),
    ];
    notifyListeners();
  }

  void fetchStories() {
    _stories = [
      {'name': 'Your Story', 'isUser': 'true'},
      {'name': 'John Doe', 'isUser': 'false'},
      {'name': 'Jane Smith', 'isUser': 'false'},
      {'name': 'Alex Brown', 'isUser': 'false'},
      {'name': 'Sara Wilson', 'isUser': 'false'},
      {'name': 'Mike Lee', 'isUser': 'false'},
    ];
    notifyListeners();
  }
}
