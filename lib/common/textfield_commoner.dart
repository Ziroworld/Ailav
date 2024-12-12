import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.obscureText,
    required this.text,
  });
  final bool obscureText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
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
