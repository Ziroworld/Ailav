part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isTermsAccepted;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isTermsAccepted,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      isLoading: false,
      isSuccess: false,
      isTermsAccepted: false,
    );
  }

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isTermsAccepted,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, isTermsAccepted];
}
