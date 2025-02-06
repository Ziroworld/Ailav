import 'package:ailav/features/auth/data/model/auth_hive_model.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthHiveModel', () {
    // Sample test data for a non-initial instance.
    const testUserId = 'test-user-id';
    const testName = 'Test User';
    const testAge = '25';
    const testEmail = 'test@example.com';
    const testPhone = '1234567890';
    const testUsername = 'testusername';
    const testPassword = 'testpassword';

    final authHiveModel = AuthHiveModel(
      userId: testUserId,
      name: testName,
      age: testAge,
      email: testEmail,
      phone: testPhone,
      username: testUsername,
      password: testPassword,
    );

    final authEntity = AuthEntity(
      userId: testUserId,
      name: testName,
      age: int.parse(testAge),
      email: testEmail,
      phone: testPhone,
      username: testUsername,
      password: testPassword,
      image: null,
    );

    test('toEnttity should convert AuthHiveModel to AuthEntity correctly', () {
      // Act: Convert the Hive model to an entity.
      final entity = authHiveModel.toEnttity();

      // Assert: The converted entity should have the same values.
      expect(entity.userId, equals(authEntity.userId));
      expect(entity.name, equals(authEntity.name));
      expect(entity.age, equals(authEntity.age));
      expect(entity.email, equals(authEntity.email));
      expect(entity.phone, equals(authEntity.phone));
      expect(entity.username, equals(authEntity.username));
      expect(entity.password, equals(authEntity.password));
      expect(entity.image, isNull);
    });

    test('fromEntity should convert AuthEntity to AuthHiveModel correctly', () {
      // Act: Convert the entity to a Hive model.
      final hiveModel = AuthHiveModel.fromEntity(authEntity);

      // Assert: The converted model should have the same values as in the entity.
      // Notice that age is stored as a string in the Hive model.
      expect(hiveModel.userId, equals(authEntity.userId));
      expect(hiveModel.name, equals(authEntity.name));
      expect(hiveModel.age, equals(authEntity.age.toString()));
      expect(hiveModel.email, equals(authEntity.email));
      expect(hiveModel.phone, equals(authEntity.phone));
      expect(hiveModel.username, equals(authEntity.username));
      expect(hiveModel.password, equals(authEntity.password));
    });

    test('initial constructor should create an AuthHiveModel with empty/default values', () {
      // Act: Create an instance using the initial constructor.
      final initialModel = AuthHiveModel.initial();

      // Assert: All fields should be set to empty strings.
      expect(initialModel.userId, equals(''));
      expect(initialModel.name, equals(''));
      expect(initialModel.age, equals(''));
      expect(initialModel.email, equals(''));
      expect(initialModel.phone, equals(''));
      expect(initialModel.username, equals(''));
      expect(initialModel.password, equals(''));
    });

    test('normal constructor should auto-generate a userId if none is provided', () {
      // Act: Create an instance without providing a userId.
      final modelWithoutUserId = AuthHiveModel(
        // Do not supply userId so that auto-generation happens.
        name: testName,
        age: testAge,
        email: testEmail,
        phone: testPhone,
        username: testUsername,
        password: testPassword,
      );

      // Assert: The generated userId should not be empty.
      expect(modelWithoutUserId.userId, isNotEmpty);
      // Optionally, you can check that it is a valid UUID format if needed.
    });
  });
}
