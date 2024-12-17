import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.obscureText,
    required this.text,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  final bool obscureText;
  final String text;
  final TextEditingController? controller; // Controller for input
  final TextInputType? keyboardType; // Keyboard type
  final String? Function(String?)? validator; // Optional validator

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)), // Rounded edges
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
