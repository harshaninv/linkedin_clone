class AuthModel {
  final String token;
  final String userId;
  final String email;
  final String password;
  final String name;
  final String profilePictureUrl;
  final String bio;
  final String location;

  AuthModel({
    required this.token,
    required this.userId,
    required this.email,
    required this.password,
    required this.name,
    required this.profilePictureUrl,
    required this.bio,
    required this.location,
  });
  
}