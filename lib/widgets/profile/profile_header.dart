import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class ProfileHeader extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueGrey.shade100,
              foregroundImage: AssetImage(profile['profileImage']),
            ),
          ),
          const SizedBox(height: 10),
          // Name
          Center(
            child: Text(
              profile['name'],
              style: LinkedInTextTheme.title.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          // Headline
          Center(
            child: Text(
              profile['headline'],
              style: LinkedInTextTheme.paragraph.copyWith(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5),
          // Description (Tags)
          Center(
            child: Text(
              profile['description'],
              style: LinkedInTextTheme.paragraph.copyWith(fontSize: 12, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5),
          // Location and Connections
          Center(
            child: Text(
              '${profile['location']} • ${profile['connections']} connections',
              style: LinkedInTextTheme.paragraph.copyWith(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10),
          // Open to Work Tag
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Open to work: ${profile['OpenToWorkRoles']}',
                style: LinkedInTextTheme.paragraph.copyWith(fontSize: 12, color: Colors.green),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0077B5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Open to',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
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
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'More',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}