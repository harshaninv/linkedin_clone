import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.secondary, // LinkedIn blue color
        // set button width to full width of parent
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Constants.textColorLight,
          fontSize: 16,
          fontWeight: FontWeight.w600, // Common bold style for auth buttons
        ),
      ),
    );
  }
}
