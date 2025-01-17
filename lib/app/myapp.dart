import 'package:ailav/core/theme/get_application_theme.dart';
import 'package:ailav/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:ailav/features/splash/presentation/view/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingScreenCubit = GetIt.instance<OnBoardingScreenCubit>();

    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      title: "Ailav",
      home: SplashScreenView(onBoardingScreenCubit: onBoardingScreenCubit),
    );
  }
}
