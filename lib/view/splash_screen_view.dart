import 'dart:async';
import 'package:ailav/core/common/logo_common.dart';
import 'package:ailav/view/login_screen_view.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next screen after 3 seconds
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreenView(),
          ),
        );
      },
    );

    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(
                height: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
