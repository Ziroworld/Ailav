part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  final String username;
  final String password;
  final Function(Widget destination) onSuccess;
  final Function(String errorMessage) onFailure;

  const LoginSubmittedEvent({
    required this.username,
    required this.password,
    required this.onSuccess,
    required this.onFailure,
  });
}

class NavigateRegisterEvent extends LoginEvent {
  final Function() onNavigate;

  const NavigateRegisterEvent({required this.onNavigate});
}

class NavigateForgotPasswordEvent extends LoginEvent {
  final Function() onNavigate;

  const NavigateForgotPasswordEvent({required this.onNavigate});
}
