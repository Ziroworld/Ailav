import 'dart:async';
import 'dart:io';

import 'package:ailav/core/common/snackbar/my_snackbar.dart';
import 'package:ailav/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:ailav/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;
  final UploadImageUsecase _uploadImageUsecase;

  RegisterBloc({
    required RegisterUsecase registerUseCase,
    required UploadImageUsecase uploadImageUseCase,
  })  : _registerUsecase = registerUseCase,
        _uploadImageUsecase = uploadImageUseCase,
        super(RegisterState.initial()) {
    on<RegisterSubmittedEvent>(_onRegisterEvent);
    on<TermsAcceptedEvent>(_onTermsAccepted);
    on<UploadImage>(_onLoadImage);
  }

  void _onRegisterEvent(
    RegisterSubmittedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.isTermsAccepted) {
      event.onFailure('You must accept the terms and conditions.');
      return;
    }

    if ([
      event.username,
      event.email,
      event.phoneNumber,
      event.password,
      event.confirmPassword,
      event.name
    ].any((field) => field.isEmpty)) {
      event.onFailure('All fields must be filled.');
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
        .hasMatch(event.email)) {
      event.onFailure('Invalid email format.');
      return;
    }

    if (event.phoneNumber.length <= 9) {
      event.onFailure('Phone number must be greater than 9 digits.');
      return;
    }

    emit(state.copyWith(isLoading: true));
    final result = await _registerUsecase.call(RegisterUserParams(
      username: event.username,
      email: event.email,
      phone: event.phoneNumber,
      password: event.password,
      name: event.name,
      age: int.parse(event.age),
      image: event.image,
    ));

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }

  FutureOr<void> _onTermsAccepted(
      TermsAcceptedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isTermsAccepted: event.isAccepted));
  }

  void _onLoadImage(
    UploadImage event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _uploadImageUsecase.call(
      UploadImageParams(
        file: event.file,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: false, imageName: r));
      },
    );
  }
}
