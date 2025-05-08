import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class ProfileSkills extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileSkills({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = profile['skills'] as List<String>;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Skills',
                    style: LinkedInTextTheme.title.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...skills.map((skill) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      skill,
                      style: LinkedInTextTheme.paragraph.copyWith(fontSize: 14),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}