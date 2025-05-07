import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../utils/text_theme.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  child: Text('T'), // Placeholder for user avatar
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(post.userName, style: LinkedInTextTheme.subtitle),
                          const SizedBox(width: 5),
                          Text('• ${post.connectionLevel}', style: LinkedInTextTheme.paragraph.copyWith(color: Colors.grey)),
                        ],
                      ),
                      Text(post.jobTitle, style: LinkedInTextTheme.paragraph.copyWith(color: Colors.grey)),
                      Text(post.timeAgo, style: LinkedInTextTheme.paragraph.copyWith(color: Colors.grey)),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),
            Text(post.content, style: LinkedInTextTheme.paragraph),
            Text('see more', style: LinkedInTextTheme.hyperlink), // Placeholder for expandable text
            const SizedBox(height: 10),
            Container(
              height: 200,
              color: Colors.grey[200], // Placeholder for post image
              child: const Center(child: Text('Image Placeholder')),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(post.likes, style: LinkedInTextTheme.paragraph.copyWith(color: Colors.grey)),
                  ],
                ),
                Text('${post.comments} comments', style: LinkedInTextTheme.paragraph.copyWith(color: Colors.grey)),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInteractionButton(Icons.thumb_up, 'Like'),
                _buildInteractionButton(Icons.comment, 'Comment'),
                _buildInteractionButton(Icons.share, 'Share'),
                _buildInteractionButton(Icons.send, 'Send'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 5),
        Text(label, style: LinkedInTextTheme.paragraph.copyWith(color: Colors.grey)),
      ],
    );
  }
}