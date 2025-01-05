import 'package:ailav/core/theme/get_application_theme.dart';
import 'package:ailav/features/splash-onboarding/presentation/view/splash_screen_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      title: "Ailav",
      home: const SplashScreenView(),
    );
  }

  
}