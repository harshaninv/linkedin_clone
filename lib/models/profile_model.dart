class ProfileModel {
  final String name;
  final String profileImage;
  final String headline;
  final String description;
  final String location;
  final int connections;
  final String about;
  final List<String> skills;
  final int followers;
  final String openToWorkRoles;
  final int viewCount;
  final int postViewCount;
  final int searchAppearances;

  ProfileModel({
    required this.name,
    this.profileImage = 'dummy_profile_image.png',
    this.headline = "",
    this.description = "",
    this.location = "",
    this.connections = 0,
    this.about = "",
    this.skills = const [],
    this.followers = 0,
    this.openToWorkRoles = "",
    this.viewCount = 0,
    this.postViewCount = 0,
    this.searchAppearances = 0,
  });
}
