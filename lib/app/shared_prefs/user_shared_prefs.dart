import 'package:ailav/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefs {
  static const String _userIdKey = 'userId';
  final SharedPreferences _sharedPreferences;

  UserSharedPrefs(this._sharedPreferences);

  Future<Either<Failure, void>> saveUserId(String userId) async {
    try {
      await _sharedPreferences.setString(_userIdKey, userId);
      return Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getUserId() async {
    try {
      final userId = _sharedPreferences.getString(_userIdKey);
      print('userId: $userId');
      return Right(userId ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> removeUserId() async {
    try {
      await _sharedPreferences.remove(_userIdKey);
      return Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}
