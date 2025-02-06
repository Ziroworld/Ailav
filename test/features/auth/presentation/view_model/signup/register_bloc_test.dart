import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:ailav/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:ailav/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Provided mock repository.
class MockAuthRepository extends Mock implements IAuthRepository {}

/// A fake BuildContext to satisfy the event parameter.
class FakeBuildContext extends Fake implements BuildContext {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUsecase registerUsecase;
  late UploadImageUsecase uploadImageUsecase;
  late RegisterBloc registerBloc;

  setUp(() {
    // Create an instance of the mock repository.
    mockAuthRepository = MockAuthRepository();
    // Instantiate the usecases using the mock repository.
    registerUsecase = RegisterUsecase(mockAuthRepository);
    uploadImageUsecase = UploadImageUsecase(mockAuthRepository);
    // Build the RegisterBloc with the actual usecases.
    registerBloc = RegisterBloc(
      registerUseCase: registerUsecase,
      uploadImageUseCase: uploadImageUsecase,
    );
  });

  group('RegisterBloc Minimal Tests', () {
    test('initial state is RegisterState.initial()', () {
      expect(registerBloc.state, RegisterState.initial());
    });

    blocTest<RegisterBloc, RegisterState>(
      'emits state with isTermsAccepted true when TermsAcceptedEvent is added',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const TermsAcceptedEvent(isAccepted: true)),
      expect: () => [RegisterState.initial().copyWith(isTermsAccepted: true)],
    );
  });
}

