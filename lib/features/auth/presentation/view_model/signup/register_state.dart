part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isTermsAccepted;
  final String? imageName;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isTermsAccepted,
    this.imageName,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      isLoading: false,
      isSuccess: false,
      isTermsAccepted: false,
      imageName: null,
    );
  }

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isTermsAccepted,
    String? imageName,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      imageName: imageName?? this.imageName,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, isTermsAccepted, imageName];
}
