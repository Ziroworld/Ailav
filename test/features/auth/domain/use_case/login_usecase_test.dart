import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authrepository.mock.dart';
import 'token.mock.dart';
import 'user.mock.dart';

// flutter test --coverage
// flutter test .\test\features\auth\domain\use_case\ --coverage
// flutter pub run test_cov_console

void main() {
  late MockTokenSharedPrefs tokenSharedPrefs;
  late MockUserSharedPrefs userSharedPrefs;
  late MockAuthRepository repository;
  late LoginUseCase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    userSharedPrefs = MockUserSharedPrefs();
    usecase = LoginUseCase(repository, tokenSharedPrefs, userSharedPrefs);
  });

  test(
      'should call the [AuthRepo.login] with correct username and password[rohan, rohan123]',
      () async {
    when(() => repository.loginUser(any(), any())).thenAnswer(
      (invocation) async {
        final username = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        if (username == 'rohan' && password == 'rohan123') {
          return Future.value(
              const Right(AuthResponse(token: 'token', userId: 'Rohan')));
        } else {
          return Future.value(
              const Left(ApiFailure(message: 'Invalid username and password')));
        }
      },
    );
    when(() => tokenSharedPrefs.saveToken(any())).thenAnswer(
      (_) async => const Right(null),
    );
    when(() => userSharedPrefs.saveUserId(any())).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await usecase(const LoginParams(
      username: 'rohan',
      password: 'rohan123',
    ));

    expect(
      result,
      const Right(AuthResponse(token: 'token', userId: 'Rohan')),
    );
    verify(() => repository.loginUser(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken('token')).called(1);
    verify(() => userSharedPrefs.saveUserId('Rohan')).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
    verifyNoMoreInteractions(userSharedPrefs);
  });
  tearDown(() {
    reset(repository);
    reset(tokenSharedPrefs);
    reset(userSharedPrefs);
  });
}
