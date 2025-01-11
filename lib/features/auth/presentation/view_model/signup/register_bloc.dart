import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initial()) {
    on<RegisterSubmittedEvent>(_onRegisterSubmitted);
    on<TermsAcceptedEvent>(_onTermsAccepted);
  }

  FutureOr<void> _onRegisterSubmitted(
      RegisterSubmittedEvent event, Emitter<RegisterState> emit) async {
    if (!state.isTermsAccepted) {
      event.onFailure('You must accept the terms and conditions.');
      return;
    }

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1)); // Simulate API call

    // Simulated registration logic
    if (event.password == event.confirmPassword) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
      event.onSuccess();
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false));
      event.onFailure('Passwords do not match.');
    }
  }

  FutureOr<void> _onTermsAccepted(
      TermsAcceptedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isTermsAccepted: event.isAccepted));
  }
}
