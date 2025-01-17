import 'package:ailav/features/onboarding/presentation/view/on_boarding_screen_view.dart';
import 'package:ailav/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit(this._onBoardingScreenCubit) : super(null);

  final OnBoardingScreenCubit _onBoardingScreenCubit;

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _onBoardingScreenCubit,
              child: const OnboardingScreen(),
            ),
          ),
        );
      }
    });
  }
}
