import 'package:ailav/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:ailav/features/auth/presentation/view_model/update_user/my_information_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock for UpdateUserUsecase.
class MockUpdateUserUsecase extends Mock implements UpdateUserUsecase {}

// Fake for UpdateUserParams to allow any() usage.
class FakeUpdateUserParams extends Fake implements UpdateUserParams {}

void main() {
  // Register fallback for UpdateUserParams.
  setUpAll(() {
    registerFallbackValue(FakeUpdateUserParams());
  });

  late MockUpdateUserUsecase mockUpdateUserUsecase;
  late MyInformationBloc bloc;

  setUp(() {
    mockUpdateUserUsecase = MockUpdateUserUsecase();
    bloc = MyInformationBloc(updateUserUsecase: mockUpdateUserUsecase);
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets('should call onFailure if name is empty', (tester) async {
    bool failureCalled = false;
    String? failureMsg;
    bool successCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          final event = UpdateUserEvent(
            context: context,
            name: '',
            email: 'test@example.com',
            phone: '1234567890',
            age: 30,
            onFailure: (msg) {
              failureCalled = true;
              failureMsg = msg;
            },
            onSuccess: () {
              successCalled = true;
            },
          );
          bloc.add(event);
          return Container();
        }),
      ),
    ));

    await tester.pumpAndSettle();

    expect(failureCalled, isTrue);
    expect(failureMsg, equals('All fields must be filled.'));
    expect(successCalled, isFalse);
    expect(bloc.state, MyInformationState.initial());
  });

  testWidgets('should call onFailure if email is invalid', (tester) async {
    bool failureCalled = false;
    String? failureMsg;
    bool successCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          final event = UpdateUserEvent(
            context: context,
            name: 'John Doe',
            email: 'invalid-email',
            phone: '1234567890',
            age: 30,
            onFailure: (msg) {
              failureCalled = true;
              failureMsg = msg;
            },
            onSuccess: () {
              successCalled = true;
            },
          );
          bloc.add(event);
          return Container();
        }),
      ),
    ));

    await tester.pumpAndSettle();

    expect(failureCalled, isTrue);
    expect(failureMsg, equals('Invalid email format.'));
    expect(successCalled, isFalse);
    expect(bloc.state, MyInformationState.initial());
  });

  testWidgets('should call onFailure if phone number is too short',
      (tester) async {
    bool failureCalled = false;
    String? failureMsg;
    bool successCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          final event = UpdateUserEvent(
            context: context,
            name: 'John Doe',
            email: 'john@example.com',
            phone: '123456789', // 9 digits
            age: 30,
            onFailure: (msg) {
              failureCalled = true;
              failureMsg = msg;
            },
            onSuccess: () {
              successCalled = true;
            },
          );
          bloc.add(event);
          return Container();
        }),
      ),
    ));

    await tester.pumpAndSettle();

    expect(failureCalled, isTrue);
    expect(failureMsg, equals('Phone number must be greater than 9 digits.'));
    expect(successCalled, isFalse);
    expect(bloc.state, MyInformationState.initial());
  });
}
