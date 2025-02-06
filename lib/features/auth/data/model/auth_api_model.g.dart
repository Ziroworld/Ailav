// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      userId: json['_id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      age: (json['age'] as num).toInt(),
      username: json['username'] as String,
      password: json['password'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'age': instance.age,
      'username': instance.username,
      'password': instance.password,
      'image': instance.image,
    };
