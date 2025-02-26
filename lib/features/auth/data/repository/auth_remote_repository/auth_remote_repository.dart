import 'dart:io';

import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthResponse>> loginUser(
      String userName, String password) async {
    try {
      final authResponse =
          await _authRemoteDataSource.loginUser(userName, password);
      return Right(authResponse);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      await _authRemoteDataSource.registerUser(user);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(
    String name,
    String email,
    int age,
    String phone,
  ) async {
    try {
      await _authRemoteDataSource.updateUser(name, email, age, phone);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, void>> updateUser(
  //     String name, String email, int age, String phone) async {
  //   try {
  //     await _authRemoteDataSource.updateUser(name, email, age, phone);
  //     return Right(null);
  //   } catch (e) {
  //     return Left(ApiFailure(message: e.toString()));
  //   }
  // }
}
