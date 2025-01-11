import 'package:ailav/app/di/di.dart';
import 'package:ailav/app/myapp.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // Initialize the Hive database
  // await HiveService().init();

  // Initialize the dependency injection container
  await initDependencies();
  runApp(
    MyApp(),
  );
}
