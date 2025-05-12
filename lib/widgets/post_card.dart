import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';
import '../models/post_model.dart';
import '../utils/text_theme.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

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
                // User Image
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Constants.textColorLight,
                  foregroundImage: AssetImage(post.userImage),
                ),
                const SizedBox(width: 10),
                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.userName,
                            style: LinkedInTextTheme.subtitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Constants.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '• ${post.connectionLevel}',
                            style: LinkedInTextTheme.paragraph.copyWith(
                              color: Constants.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        post.jobTitle,
                        style: LinkedInTextTheme.paragraph.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Constants.primaryColor,
                        ),
                      ),
                      Text(
                        post.timeAgo,
                        style: LinkedInTextTheme.paragraph.copyWith(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_vert, color: Constants.secondaryLight),
              ],
            ),
            const SizedBox(height: 10),
            // Post Content
            Text(
              post.content,
              style: LinkedInTextTheme.paragraph.copyWith(
                color: Constants.secondaryDark,
              ),
            ),
            Text('see more', style: LinkedInTextTheme.hyperlink),

            const SizedBox(height: 10),

            // Post Image
            if (post.postImage.isNotEmpty) // Check if postImage is not empty
              _buildPostImage(post.postImage),

            const SizedBox(height: 10),

            // Interaction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.groups_2,
                      size: 20,
                      color: Constants.secondary,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      post.likes,
                      style: LinkedInTextTheme.paragraph.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Constants.secondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${post.comments} comments',
                  style: LinkedInTextTheme.paragraph.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Constants.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 10),
                      child: Icon(
                        Icons.thumb_up,
                        size: 20,
                        color: Constants.secondaryLight,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 10),
                      child: Icon(
                        Icons.messenger_rounded,
                        size: 20,
                        color: Constants.secondaryLight,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 10),
                      child: Icon(
                        Icons.share,
                        size: 20,
                        color: Constants.secondaryLight,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(right: 10, left: 20),
                  child: Icon(
                    Icons.bookmark,
                    size: 20,
                    color: Constants.secondaryLight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostImage(String imagePath) {
    return Image(
      height: 200,
      width: double.infinity,
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
    );
  }
}
