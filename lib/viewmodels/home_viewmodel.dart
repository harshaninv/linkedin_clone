import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/post_model.dart';
import 'package:linkedin_clone/models/story_model.dart';
import 'package:linkedin_clone/utils/constants.dart';

class HomeViewmodel extends ChangeNotifier {
  List<PostModel> _posts = [];
  List<StoryModel> _stories = [];

  List<PostModel> get posts => _posts;
  List<StoryModel> get stories => _stories;

  void fetchPosts() {
    _posts = [
      PostModel(
        userName: 'Chandler Bing',
        content: 'Creating opportunity for every member of the global workforce drives everything we do at Link...',
        timeAgo: '1w • Edited',
        connectionLevel: '2nd',
        jobTitle: 'Android Dev at i Labs',
        likes: 'Harshani and 97 others',
        comments: '77',
        userImage: Constants.storyImage3,
        postImage: Constants.postImage1
      ),
      PostModel(
        userName: 'Monica Geller',
        content: 'Excited to announce that I have joined the team at i Labs as Flutter Intern!. Thank you to everyone who has supported me on this journey. I am looking forward to this new chapter in my career!',
        timeAgo: '2d • Edited',
        connectionLevel: '1st',
        jobTitle: 'Software Engineer at i Labs',
        likes: 'Tharushi and 50 others',
        comments: '20',
        userImage: Constants.storyImage5,
        postImage: Constants.postImage2
      ),
    ];
    notifyListeners();
  }

  void fetchStories() {
    _stories = [
      StoryModel(
        userName: 'Asa Butterfield',
        imageUrl: Constants.storyImage1,
        isUser: true,
      ),
      StoryModel(
        userName: 'Mave',
        imageUrl: Constants.storyImage2,
      ),
      StoryModel(
        userName: 'Chandler Bing',
        imageUrl: Constants.storyImage3,
      ),
      StoryModel(
        userName: 'Rachel Green',
        imageUrl: Constants.storyImage4,
      ),
      StoryModel(
        userName: 'Monica Geller',
        imageUrl: Constants.storyImage5,
      ),
      StoryModel(
        userName: 'Otis Milburn',
        imageUrl: Constants.storyImage1,
      ),
    ];
    notifyListeners();
  }
}
