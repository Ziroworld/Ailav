import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/bg_removed_logo.png',
      height: height,
    );
  }
}
