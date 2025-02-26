import 'package:ailav/app/di/di.dart';
import 'package:ailav/app/myapp.dart';
import 'package:ailav/core/network/hive_service.dart';
import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // Initialize the Hive database
  await HiveService.init();

  // Initialize the dependency injection container
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginBloc>(), // Provide LoginBloc globally
        ),
        // BlocProvider(
        //   create: (context) => getIt<SettingCubit>(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}
