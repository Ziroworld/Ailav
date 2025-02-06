part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}
class TermsAcceptedEvent extends RegisterEvent {
  final bool isAccepted;

  const TermsAcceptedEvent({required this.isAccepted});
}
class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterSubmittedEvent extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String name;
  final String age;
  final String? image;
  final Function() onSuccess;
  final Function(String errorMessage) onFailure;

  const RegisterSubmittedEvent({
    required this.context,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.age,
    required this.onSuccess,
    required this.onFailure,
    this.image
  });
}

