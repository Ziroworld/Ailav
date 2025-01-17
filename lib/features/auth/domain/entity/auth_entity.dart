import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String name;
  final int age;
  final String email;
  final String phone;
  final String username;
  final String password;

  const AuthEntity({
    this.userId,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userId,
        name,
        age,
        email,
        phone,
        username,
        password,
      ];
}
