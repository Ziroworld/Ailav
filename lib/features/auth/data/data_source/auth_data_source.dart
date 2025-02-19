import 'dart:io';

import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';

abstract interface class IAuthDataSource {
  Future<void> registerUser(AuthEntity user);
  Future<AuthResponse> loginUser(String username, String password);

  Future<void> getCurrentUser();
  Future<String> uploadProfilePicture(File file);
  Future<void> updateUser(String name, String email,int age, String phone);
}
