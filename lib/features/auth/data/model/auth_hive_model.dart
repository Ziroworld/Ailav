import 'package:ailav/app/constants/hive_table_constant.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String username;
  @HiveField(6)
  final String password;

  AuthHiveModel({
    String? userId,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // from Entity
  const AuthHiveModel.initial()
      : userId = '',
        name = '',
        age = '',
        email = '',
        phone = '',
        username = '',
        password = '';

  AuthEntity toEnttity() {
    return AuthEntity(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      age: int.tryParse(age) ?? 0,
      username: username,
      password: password,
      image: null,
    );
  }

  // to Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      name: entity.name,
      age: entity.age.toString(),
      email: entity.email,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        name,
        age,
        email,
        phone,
        username,
        password,
      ];
}
