import 'package:flutter/material.dart';

class UserScreenView extends StatelessWidget {
  const UserScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [Text("Welcome to user dashboard ")])));
  }
}
