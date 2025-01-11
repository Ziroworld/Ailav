import 'dart:async';

import 'package:ailav/features/admin_dashboard/presentation/view/admin_dashboard_view.dart';
import 'package:ailav/features/auth/data/model/auth_model.dart';
import 'package:ailav/features/home/presentation/view/client_homepage_view.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginSubmittedEvent>(_onLoginSubmitted);
    on<NavigateRegisterEvent>(_onNavigateRegister);
    on<NavigateForgotPasswordEvent>(_onNavigateForgotPassword);
  }

  FutureOr<void> _onLoginSubmitted(
      LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call

    final role = AuthModel.authenticate(event.username, event.password);
    if (role == 'admin') {
      emit(
          state.copyWith(isLoading: false, isSuccess: true, userRole: 'admin'));
      event.onSuccess(const AdminDashboardView());
    } else if (role == 'customer') {
      emit(state.copyWith(
          isLoading: false, isSuccess: true, userRole: 'customer'));
      event.onSuccess(const ClientHomepageView());
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false));
      event.onFailure('Invalid username or password');
    }
  }

  FutureOr<void> _onNavigateRegister(
      NavigateRegisterEvent event, Emitter<LoginState> emit) {
    event.onNavigate();
  }

  FutureOr<void> _onNavigateForgotPassword(
      NavigateForgotPasswordEvent event, Emitter<LoginState> emit) {
    event.onNavigate();
  }
}
