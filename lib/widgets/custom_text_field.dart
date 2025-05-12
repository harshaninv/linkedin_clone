import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/constants.dart';
import 'package:linkedin_clone/utils/text_theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onPasswordVisibilityToggle;
  final bool? initialPasswordVisibilityToggle;

  const CustomTextField({
    super.key,
    this.controller,
    required this.label,
    this.isPassword = false,
    this.onChanged,
    this.onPasswordVisibilityToggle,
    this.initialPasswordVisibilityToggle,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _effectiveController;
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _effectiveController = widget.controller ?? TextEditingController();
    _isPasswordVisible = widget.initialPasswordVisibilityToggle ?? false;
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _effectiveController = widget.controller ?? TextEditingController();
    }
    if (widget.initialPasswordVisibilityToggle !=
        oldWidget.initialPasswordVisibilityToggle) {
      setState(() {
        _isPasswordVisible = widget.initialPasswordVisibilityToggle ?? false;
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _effectiveController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _effectiveController,
      obscureText: widget.isPassword && !_isPasswordVisible,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight:
              FontWeight.w400, // Common label style for auth text fields
          color: Constants.secondaryLight,
        ),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        suffixIcon:
            widget.isPassword
                ? TextButton.icon(
                  label: Text(
                    _isPasswordVisible ? 'Hide' : 'Show',
                    style: LinkedInTextTheme.hyperlink,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                    if (widget.onPasswordVisibilityToggle != null) {
                      widget.onPasswordVisibilityToggle!();
                    }
                  },
                )
                : null,
      ),
    );
  }
}
