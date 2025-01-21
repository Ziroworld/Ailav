import 'package:ailav/core/common/logo_common.dart';
import 'package:ailav/features/auth/presentation/view/login_screen_view.dart';
import 'package:ailav/features/onboarding/presentation/view/on_boarding_screen_view.dart';
import 'package:ailav/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  final OnBoardingScreenCubit onBoardingScreenCubit;

  const SplashScreenView({super.key, required this.onBoardingScreenCubit});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: onBoardingScreenCubit.checkIfOnboardingCompleted(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Logo(
                  height: 500,
                ),
              ),
            ),
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          // Navigate to Login if onboarding is completed
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreenView()),
            );
          });
        } else {
          // Navigate to Onboarding if not completed
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            );
          });
        }
        // Return an empty container while navigation happens
        return const SizedBox.shrink();
      },
    );
  }
}
