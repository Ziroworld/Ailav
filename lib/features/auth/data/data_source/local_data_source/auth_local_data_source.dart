import 'package:ailav/core/network/hive_service.dart';
import 'package:ailav/features/auth/data/data_source/auth_data_source.dart';
import 'package:ailav/features/auth/data/model/auth_hive_model.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    return Future.value( const AuthEntity(
      userId: '',
      name: '',
      username: '',
      password: '',
      email: '',
      phone: '',
      age: 19,

    ));
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      await _hiveService.login(username, password);
      return Future.value('Login successfully');
    } catch (e) {
      return Future.error('Login failed: $e');
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel.fromEntity(user);

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }
}
