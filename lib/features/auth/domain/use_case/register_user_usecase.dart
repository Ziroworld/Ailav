import 'package:ailav/app/usecase/usecase.dart';
import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUserParams extends Equatable {
  final String name;
  final int age;
  final String email;
  final String phone;
  final String username;
  final String password;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.name,
    required this.age,
  });

  // initialize the constructor
  const RegisterUserParams.initial({
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        name,
        age,
        email,
        phone,
        username,
        password,
      ];
}

class RegisterUsecase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;
  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      name: params.name,
      age: params.age,
      email: params.email,
      phone: params.phone,
      username: params.username,
      password: params.password,
    );
    return repository.registerUser(authEntity);
  }
}
