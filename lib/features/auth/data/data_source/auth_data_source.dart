import 'dart:io';

import 'package:ailav/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<void> registerUser(AuthEntity user);
  Future<String> loginUser(String username, String password);

  Future<void> getCurrentUser();
  Future<String> uploadProfilePicture(File file);

}
