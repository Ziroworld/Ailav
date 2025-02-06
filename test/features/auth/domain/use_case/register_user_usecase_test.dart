import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:ailav/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authrepository.mock.dart';

void main() {
  late MockAuthRepository repository;
  late RegisterUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = RegisterUsecase(repository);
    registerFallbackValue(const AuthEntity.empty());
  });

  final params = RegisterUserParams.empty();

  test('should call the [AuthRepo.registerUser]', () async {
    when(() => repository.registerUser(any())).thenAnswer(
      (_) async => const Right(null),
    );

    // Act
    final result = await usecase(params);

    // assert
    expect(result, const Right(null));

    //verify
    verify(() => repository.registerUser(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
