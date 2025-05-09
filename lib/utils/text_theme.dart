import 'package:flutter/material.dart';

class LinkedInTextTheme {
  // Title: Bold, large text for headings (e.g., page titles)
  static const TextStyle title = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  // Subtitle: Medium weight, smaller text for subheadings (e.g., auth page descriptions)
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  // Paragraph: Regular text for body content (e.g., post content)
  static const TextStyle paragraph = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  // Hyperlink: Blue, underlined text for links (e.g., "Forgot password?")
  static const TextStyle hyperlink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF0077B5),
  );
}