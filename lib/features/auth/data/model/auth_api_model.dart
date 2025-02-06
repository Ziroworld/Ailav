import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String name;
  final String email;
  final String phone;
  final int age;
  final String username;
  final String password;
  final String? image;

  const AuthApiModel(
      {this.userId,
      required this.name,
      required this.email,
      required this.phone,
      required this.age,
      required this.username,
      required this.password,
      required this.image});

  AuthEntity toEnttity() {
    return AuthEntity(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      age: age,
      username: username,
      password: password,
      image: image,
    );
  }

  factory AuthApiModel.fromEnttity(AuthEntity entity) {
    return AuthApiModel(
        name: entity.name,
        email: entity.email,
        phone: entity.phone,
        age: entity.age,
        username: entity.username,
        password: entity.password,
        image: entity.image);
  }

  @override
  List<Object?> get props => [
        userId,
        name,
        email,
        phone,
        age,
        username,
        password,
        image,
      ];
}
