import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class ProfileAbout extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileAbout({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: LinkedInTextTheme.title.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                profile['about'],
                style: LinkedInTextTheme.paragraph.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}