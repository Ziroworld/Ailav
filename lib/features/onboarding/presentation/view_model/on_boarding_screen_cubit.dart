import 'package:ailav/features/auth/presentation/view/login_screen_view.dart';
import 'package:ailav/features/onboarding/presentation/view/on_boarding_screen_view.dart';
import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreenCubit extends Cubit<void> {
  final LoginBloc _loginBloc;

  OnBoardingScreenCubit(this._loginBloc) : super(null);

  Future<void> init(BuildContext context) async {
    // Simulate loading or fetching onboarding status
    bool isOnboardingCompleted = await checkIfOnboardingCompleted();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (isOnboardingCompleted) {
              // Navigate to Login if onboarding is completed
              return BlocProvider.value(
                value: _loginBloc,
                child: LoginScreenView(),
              );
            } else {
              // Navigate to Onboarding if not completed
              return const OnboardingScreen();
            }
          },
        ),
      );
    }
  }

  Future<bool> checkIfOnboardingCompleted() async {
    // Replace with your logic to check onboarding status (e.g., shared preferences, API call)
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    return false; // Return true if onboarding is completed
  }
}
