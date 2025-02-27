import 'package:ailav/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authrepository.mock.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late UpdateUserUsecase usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UpdateUserUsecase(mockAuthRepository);
  });

  const tParams = UpdateUserParams(
    name: 'John Doe',
    age: 30,
    email: 'john@example.com',
    phone: '1234567890',
  );

  testWidgets(
      'should call repository.updateUser with correct parameters and return Right(null)',
      (tester) async {
    // Arrange
    when(() => mockAuthRepository.updateUser(
          any(),
          any(),
          any(),
          any(),
        )).thenAnswer((_) async => const Right(null));
    // Act
    final result = await usecase(tParams);
    // Assert
    expect(result, const Right(null));
    verify(() => mockAuthRepository.updateUser(
          tParams.name,
          tParams.email,
          tParams.age,
          tParams.phone,
        )).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
