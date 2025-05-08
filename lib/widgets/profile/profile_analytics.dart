import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class ProfileAnalytics extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileAnalytics({Key? key, required this.profile}) : super(key: key);

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
                'Analytics',
                style: LinkedInTextTheme.title.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${profile['viewCount']}',
                        style: LinkedInTextTheme.paragraph.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Profile views',
                        style: LinkedInTextTheme.paragraph.copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${profile['postViewCount']}',
                        style: LinkedInTextTheme.paragraph.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Post views',
                        style: LinkedInTextTheme.paragraph.copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${profile['searchAppearances']}',
                        style: LinkedInTextTheme.paragraph.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Search appearances',
                        style: LinkedInTextTheme.paragraph.copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}