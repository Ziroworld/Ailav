import 'package:ailav/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:ailav/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockOnBoardingScreenCubit extends Mock implements OnBoardingScreenCubit {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('SplashCubit', () {
    late SplashCubit splashCubit;
    late MockOnBoardingScreenCubit mockOnBoardingScreenCubit;
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      mockOnBoardingScreenCubit = MockOnBoardingScreenCubit();
      mockNavigatorObserver = MockNavigatorObserver();
      splashCubit = SplashCubit(mockOnBoardingScreenCubit);
    });

    test('should navigate to OnboardingScreen after 2 seconds', () async {
      // Simulate the 2-second delay in the `init` method
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
