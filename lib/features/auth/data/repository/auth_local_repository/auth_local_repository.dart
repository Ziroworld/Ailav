import 'dart:io';

import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:ailav/features/auth/domain/repository/auth_repository.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final CurrentUser = await _authLocalDataSource.getCurrentUser();
      return Right(CurrentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> loginUser(
    String email,
    String password,
  ) async {
    try {
      final authResponse =
          await _authLocalDataSource.loginUser(email, password);
      return Right(
          AuthResponse(token: authResponse.token, userId: authResponse.userId));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      return Right(_authLocalDataSource.registerUser(user));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, String>> updateUser(String name, String email, int age, String phone) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
