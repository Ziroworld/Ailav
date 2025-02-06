import 'package:ailav/app/shared_prefs/token_shared_prefs.dart';
import 'package:ailav/core/network/api_service.dart';
import 'package:ailav/core/network/hive_service.dart';
import 'package:ailav/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:ailav/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ailav/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:ailav/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:ailav/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:ailav/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:ailav/features/home/presentation/view_model/home_cubit.dart';
import 'package:ailav/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:ailav/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initLoginDependencies();
  await _initRegisterDependencies();
  await _initOnboardingDependencies();
  await _initSplashDependencies();
  await _initHomeDependencies();
}

_initSplashDependencies() {
  getIt.registerFactory<SplashCubit>(
      () => SplashCubit(getIt<OnBoardingScreenCubit>()));
}
Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}
_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

//==================REGISTER==========================
_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init remote data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // init remote repository
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );
  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUseCase: getIt(),
    ),
  );
}

//==================LOGIN==========================
_initLoginDependencies() async {
  // =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initOnboardingDependencies() {
  getIt.registerFactory<OnBoardingScreenCubit>(
    () => OnBoardingScreenCubit(loginBloc: getIt<LoginBloc>()),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}
