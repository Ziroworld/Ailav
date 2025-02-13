import 'package:ailav/features/auth/data/model/auth_api_model.dart';
import 'package:ailav/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthApiModel', () {
    // Define a sample AuthApiModel with test values.
    const authApiModel = AuthApiModel(
      userId: '123',
      name: 'Test User',
      email: 'test@example.com',
      phone: '1234567890',
      age: 30,
      username: 'testuser',
      password: 'password123',
      image: 'http://example.com/image.png',
    );

    // Define an equivalent AuthEntity with the same values.
    const authEntity = AuthEntity(
      userId: '123',
      name: 'Test User',
      email: 'test@example.com',
      phone: '1234567890',
      age: 30,
      username: 'testuser',
      password: 'password123',
      image: 'http://example.com/image.png',
    );

    test('toEnttity should convert AuthApiModel to AuthEntity correctly', () {
      // Act: Convert the API model to an entity.
      final entity = authApiModel.toEnttity();

      // Assert: The converted entity should have the same values.
      expect(entity.userId, authEntity.userId);
      expect(entity.name, authEntity.name);
      expect(entity.email, authEntity.email);
      expect(entity.phone, authEntity.phone);
      expect(entity.age, authEntity.age);
      expect(entity.username, authEntity.username);
      expect(entity.password, authEntity.password);
      expect(entity.image, authEntity.image);
    });

    test('fromEnttity should convert AuthEntity to AuthApiModel correctly', () {
      // Act: Convert the entity to an API model.
      final model = AuthApiModel.fromEnttity(authEntity);

      // Assert: The converted model should have the same values as in the entity,
      // except for the userId which is not provided by the factory (and thus remains null).
      expect(model.name, authEntity.name);
      expect(model.email, authEntity.email);
      expect(model.phone, authEntity.phone);
      expect(model.age, authEntity.age);
      expect(model.username, authEntity.username);
      expect(model.password, authEntity.password);
      expect(model.image, authEntity.image);
      expect(model.userId, isNull,
          reason: 'userId should be null when created from an entity');
    });

    test(
        'initial constructor should create an AuthApiModel with empty/default values',
        () {
      // Act: Create an instance using the initial constructor.
      const initialModel = AuthApiModel.initial();

      // Assert: The fields should be set to empty or default values.
      expect(initialModel.userId, equals(''));
      expect(initialModel.name, equals(''));
      expect(initialModel.email, equals(''));
      expect(initialModel.phone, equals(''));
      expect(initialModel.age, equals(0));
      expect(initialModel.username, equals(''));
      expect(initialModel.password, equals(''));
      expect(initialModel.image, equals(''));
    });
  });
}
