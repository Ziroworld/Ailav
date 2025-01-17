part of 'login_bloc.dart';

class LoginState  {
  final bool isLoading;
  final bool isSuccess;
  // final String? userRole;

  const LoginState({
    required this.isLoading,
    required this.isSuccess,
    // this.userRole,
  });

  factory LoginState.initial() {
    return const LoginState(isLoading: false, isSuccess: false);
  }

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? userRole,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      // userRole: userRole ?? this.userRole,
    );
  }
}
