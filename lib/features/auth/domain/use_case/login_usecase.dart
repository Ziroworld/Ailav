import 'package:ailav/app/shared_prefs/token_shared_prefs.dart';
import 'package:ailav/app/shared_prefs/user_shared_prefs.dart';
import 'package:ailav/app/usecase/usecase.dart';
import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({
    required this.username,
    required this.password,
  });

  const LoginParams.initial()
      : username = '',
        password = '';

  @override
  List<Object?> get props => [username, password];
}

class AuthResponse extends Equatable {
  final String token;
  final String userId;

  const AuthResponse({
    required this.token,
    required this.userId,
  });

  @override
  List<Object?> get props => [token, userId];
}

class LoginUseCase implements UsecaseWithParams<AuthResponse, LoginParams> {
  final IAuthRepository repository;
  final TokenSharedPrefs tokenSharedPrefs;
  final UserSharedPrefs userSharedPrefs;

  LoginUseCase(this.repository, this.tokenSharedPrefs, this.userSharedPrefs);

  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) {
    return repository.loginUser(params.username, params.password).then((value) {
      return value.fold(
        (failure) => Left(failure),
        (authResponse) {
          // tokenSharedPrefs.saveToken(token);
          tokenSharedPrefs.saveToken(authResponse.token);
          print('authResponse.userId: ${authResponse.userId}');
          userSharedPrefs.saveUserId(authResponse.userId);
          return Right(AuthResponse(token: authResponse.token, userId: authResponse.userId));
        },
      );
    });
  }
}
