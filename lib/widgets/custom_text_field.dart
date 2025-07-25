import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.showVisibilityToggle = false,
    this.isPasswordVisible,
    this.onToggleVisibility,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool showVisibilityToggle;
  final bool? isPasswordVisible;
  final VoidCallback? onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText && !(isPasswordVisible ?? false),
      cursorColor: Colors.orange,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.orange),
        suffixIcon: showVisibilityToggle
            ? IconButton(
          icon: Icon(
            (isPasswordVisible ?? false)
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.orange,
          ),
          onPressed: onToggleVisibility,
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
