import 'dart:io';

import 'package:ailav/app/constants/api_endpoints.dart';
import 'package:ailav/app/shared_prefs/user_shared_prefs.dart';
import 'package:ailav/features/auth/data/data_source/auth_data_source.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:ailav/features/auth/domain/use_case/login_usecase.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;
  final UserSharedPrefs _userSharedPrefs;
  AuthRemoteDataSource(this._dio, this._userSharedPrefs);

  @override
  Future<void> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> loginUser(String username, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        final userId = response.data['userId'];
        return AuthResponse(token: token, userId: userId);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "name": user.name,
          "email": user.email,
          "phone": user.phone,
          "age": user.age,
          "username": user.username,
          "password": user.password,
          "image": user.image,
        },
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        final str = response.data['data'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUser(
      String name, String email, int age, String phone) async {
    try {
      final userId = await _userSharedPrefs.getUserId();
      userId.fold((l) => throw Exception(l), (r) async {
        final response = await _dio.put(
          "${ApiEndpoints.baseUrl}${ApiEndpoints.updateUser}/$r",
          data: {
            "name": name,
            "email": email,
            "age": age,
            "phone": phone,
          },
        );

        if (response.statusCode == 201) {
          return;
        } else {
          throw Exception(response.statusMessage);
        }
      });
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
