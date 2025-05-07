import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onPasswordVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onPasswordVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400, // Common label style for auth text fields
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        suffixIcon: isPassword
            ? TextButton.icon(
                label: Text(
                  isPasswordVisible ? 'Hide' : 'Show',
                  style: LinkedInTextTheme.hyperlink,
                ),
                onPressed: onPasswordVisibilityToggle,
              )
            : null,
      ),
    );
  }
}