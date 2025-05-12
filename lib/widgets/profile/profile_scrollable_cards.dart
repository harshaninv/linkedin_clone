import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class ProfileScrollableCards extends StatelessWidget {
  const ProfileScrollableCards({super.key});

  @override
  Widget build(BuildContext context) {
    // List of card data
    final List<Map<String, String>> cards = [
      {
        'title': 'Open to work',
        'description': 'iOS Developer roles',
      },
      {
        'title': 'Looking for projects',
        'description': 'Freelance opportunities',
      },
      {
        'title': 'Available for hire',
        'description': 'Full-time positions',
      },
      {
        'title': 'Networking',
        'description': 'Connect with professionals',
      },
    ];

    // Calculate card width (approximately 1/4 of screen width)
    final double cardWidth = MediaQuery.of(context).size.width * 0.85;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 100, // Adjust height to fit card content
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: cards.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final card = cards[index];
            return InkWell(
              onTap: () {
                // Handle card tap (e.g., navigate to a details page)
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: cardWidth,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300, // Beige background
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      card['title']!,
                      style: LinkedInTextTheme.subtitle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      card['description']!,
                      style: LinkedInTextTheme.paragraph.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'See all details',
                      style: LinkedInTextTheme.hyperlink.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Constants.secondary,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}