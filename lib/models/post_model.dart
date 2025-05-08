class PostModel {
  final String userName;
  final String content;
  final String timeAgo;
  final String connectionLevel;
  final String jobTitle;
  final String likes;
  final String comments;
  final String userImage; 
  final String postImage;

  PostModel({
    required this.userName,
    required this.content,
    required this.timeAgo,
    required this.connectionLevel,
    required this.jobTitle,
    required this.likes,
    required this.comments,
    required this.userImage,
    this.postImage = '',
  });
}