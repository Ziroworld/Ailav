import 'package:ailav/app/usecase/usecase.dart';
import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateUserParams extends Equatable {
  final String name;
  final int age;
  final String email;
  final String phone;

  const UpdateUserParams({
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, age, email, phone];
}

class UpdateUserUsecase implements UsecaseWithParams<void, UpdateUserParams> {
  final IAuthRepository repository;
  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateUserParams params) {
    return repository.updateUser(
      params.name,
      params.email,
      params.age,
      params.phone,
    );
  }
}
