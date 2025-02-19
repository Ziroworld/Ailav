import 'dart:async';

import 'package:ailav/core/common/snackbar/my_snackbar.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:ailav/features/home/presentation/view/client_homepage_view.dart';
import 'package:ailav/features/home/presentation/view_model/home_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginUseCase loginUseCase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    on<LoginSubmittedEvent>(_onLoginSubmitted);
    on<NavigateRegisterEvent>(_onNavigateRegister);
    on<NavigateForgotPasswordEvent>(_onNavigateForgotPassword);

    on<NavigateHomeScreenEvent>(
      (event, emit) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _homeCubit,
              child: event.destination,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _onLoginSubmitted(
      LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call

    final result = await _loginUseCase(LoginParams(
      username: event.username,
      password: event.password,
    ));
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Invalid Credentials",
          color: Colors.red,
        );
      },
      (authResponse) {
        print("ÖK");
        emit(state.copyWith(isLoading: false, isSuccess: true));
        add(
          NavigateHomeScreenEvent(
            context: event.context,
            destination: const ClientHomepageView(),
          ),
        );
      },
    );
  }

  _onNavigateRegister(NavigateRegisterEvent event, Emitter<LoginState> emit) {
    event.onNavigate();
  }

  FutureOr<void> _onNavigateForgotPassword(
      NavigateForgotPasswordEvent event, Emitter<LoginState> emit) {
    event.onNavigate();
  }
}
