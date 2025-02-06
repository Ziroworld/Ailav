import 'dart:io';

import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:ailav/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Define a fake class for File to be used as a fallback value.
class FakeFile extends Fake implements File {}

// Create a mock class for IAuthRepository.
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  // Register the fallback value for File before any tests run.
  setUpAll(() {
    registerFallbackValue(FakeFile());
  });

  late MockAuthRepository mockAuthRepository;
  late UploadImageUsecase uploadImageUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    uploadImageUsecase = UploadImageUsecase(mockAuthRepository);
  });

  test(
      'should call repository.uploadProfilePicture and return a Right(String) when successful',
      () async {
    // Arrange: Create a dummy File instance and the expected parameters.
    final dummyFile = File('dummy_path'); // This dummy file simulates a file.
    final params = UploadImageParams(file: dummyFile);
    const expectedUrl = "http://example.com/profile.png";

    when(() => mockAuthRepository.uploadProfilePicture(any()))
        .thenAnswer((_) async => const Right(expectedUrl));

    // Act
    final result = await uploadImageUsecase(params);

    // Assert
    expect(result, const Right(expectedUrl));
    verify(() => mockAuthRepository.uploadProfilePicture(dummyFile)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
