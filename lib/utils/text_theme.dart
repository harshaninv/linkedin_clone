import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';

class LinkedInTextTheme {
  // Title: Bold, large text for headings (e.g., page titles)
  static const TextStyle title = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: Constants.textColor,
  );

  // Subtitle: Medium weight, smaller text for subheadings (e.g., auth page descriptions)
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Constants.textColor,
  );

  // Paragraph: Regular text for body content (e.g., post content)
  static const TextStyle paragraph = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Constants.textColor,
  );

  // Hyperlink: Blue, underlined text for links (e.g., "Forgot password?")
  static const TextStyle hyperlink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Constants.secondary,
  );
}
