import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  _initRegisterDependencies();
  _initLoginDependencies();
}

void _initRegisterDependencies() {
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc());
}

void _initLoginDependencies() {
  getIt.registerFactory<LoginBloc>(() => LoginBloc());
}
