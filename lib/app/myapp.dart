import 'package:ailav/app/di/di.dart';
import 'package:ailav/core/theme/get_application_theme.dart';
import 'package:ailav/features/splash/presentation/view/splash_screen_view.dart';
import 'package:ailav/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:ailav/sensor/near.detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final onBoardingScreenCubit = GetIt.instance<OnBoardingScreenCubit>();

    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      title: "Ailav",
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: const SplashScreenView(),
      ),
      builder: (context, child) {
        return GlobalProximityListener(child: child!);
      },
    );
  }
}
