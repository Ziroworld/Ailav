import 'package:ailav/core/network/hive_service.dart';
import 'package:ailav/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:ailav/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:ailav/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:ailav/features/home/presentation/view_model/home_cubit.dart';
import 'package:ailav/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:ailav/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();

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

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}


_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(
      getIt<AuthLocalRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}
_initLoginDependencies() async {
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthLocalRepository>(),
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
