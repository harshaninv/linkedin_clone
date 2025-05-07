import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/post_model.dart';

class HomeViewmodel extends ChangeNotifier {
  List<PostModel> _posts = [];

  List<PostModel> get posts => _posts;

  void fetchPosts() {
    _posts = [
      PostModel(
        username: 'John Doe',
        content: 'exited about my new job!',
        timeAgo: '2 hours ago',
      ),
      PostModel(
        username: 'Jane Smith',
        content: 'Just completed a project!',
        timeAgo: '1 day ago',
      ),
      PostModel(
        username: 'Alice Johnson',
        content: 'Networking is key!',
        timeAgo: '3 days ago',
      ),
    ];
    notifyListeners();
  }
}
