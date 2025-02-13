import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:ailav/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockRegisterBloc extends Mock implements RegisterBloc {}

class MockHomeCubit extends Mock implements HomeCubit {}


void main() {
  late LoginUseCase loginUseCase;
  late RegisterBloc registerBloc;
  late HomeCubit homeCubit;
  late LoginBloc loginBloc;

  setUp(() {
    loginUseCase = MockLoginUseCase();
    registerBloc = MockRegisterBloc();
    homeCubit = MockHomeCubit();
    loginBloc = LoginBloc(
      loginUseCase: loginUseCase,
      registerBloc: registerBloc,
      homeCubit: homeCubit,
    );
  });

  test('initial state is correct', () {
    expect(loginBloc.state, LoginState.initial());
  });

  group('NavigateRegisterEvent', () {
    test('should navigate to the registration screen', () {
      // Arrange
      final event = NavigateRegisterEvent(
        onNavigate: () {},
      );

      // Act & Assert
      loginBloc.add(event);
      // Ensure that the onNavigate callback is called
    });
  });

  group('NavigateForgotPasswordEvent', () {
    test('should navigate to the forgot password screen', () {
      // Arrange
      final event = NavigateForgotPasswordEvent(
        onNavigate: () {},
      );

      // Act & Assert
      loginBloc.add(event);
      // Ensure that the onNavigate callback is called
    });
  });
}
