import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class ProfileHeader extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile and Cover Photo
        SizedBox(
          height:
              250, // Adjust height to accommodate cover photo and profile image
          child: Stack(
            children: [
              // Cover Photo
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Constants.coverImage3),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Profile Image and Icons
              Positioned(
                left: 16,
                top: 150, // Offset to place profile image over cover photo
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blueGrey.shade100,
                          foregroundImage: AssetImage(profile['profileImage']),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Edit Pencil Icon
                  ],
                ),
              ),
              // edit icon
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white, size: 30),
                  highlightColor: Colors.blue,
                  onPressed: () {
                    // Handle edit action
                  },
                ),
              ),
            ],
          ),
        ),

        // Profile Name and Headline and description and followers and connnections
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile['name'],
                style: LinkedInTextTheme.subtitle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                profile['headline'],
                style: LinkedInTextTheme.subtitle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(profile['description'], style: LinkedInTextTheme.paragraph),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${profile['followers']} Followers',
                    style: LinkedInTextTheme.hyperlink.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "  .  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '+ ${profile['connections']} Connections',
                    style: LinkedInTextTheme.hyperlink.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // three buttons representing 'Open to' , 'Add Section' and 'More'
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0077B5), // LinkedIn blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Open to',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Space between buttons
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Add section',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.blueGrey,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
