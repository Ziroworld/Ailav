import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String name;
  final int age;
  final String email;
  final String phone; // coverage:ignore-line
  final String username;
  final String password;
  final String? image;

  const AuthEntity({
    this.userId,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });

  const AuthEntity.empty()
      : userId = 'empty.userId',
        name = 'empty.name',
        age = 0,
        email = 'empty.email',
        phone = 'empty.phone',
        username = 'empty.username',
        password = 'empty.password',
        image = null;

  @override
  List<Object?> get props => [
        userId,
        name,
        age,
        // coverage:ignore-start
        email,
        phone,
        username,
        password,
        // coverage:ignore-end
        image,
      ];
}
