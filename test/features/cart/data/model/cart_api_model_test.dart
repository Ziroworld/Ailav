import 'package:ailav/features/cart/data/model/cart_api_model.dart';
import 'package:ailav/features/cart/data/model/cart_item_api_model.dart';
import 'package:ailav/features/cart/domain/entity/cart_entity.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartApiModel', () {
    // Create a dummy CartItemApiModel and corresponding CartItemEntity.
    const dummyCartItemApiModel = CartItemApiModel(
      productId: 'p1',
      productName: 'Test Product',
      productImage: 'https://example.com/image.png',
      // productDescription: 'A test product',
      quantity: 1,
      price: 100.0,
    );

    const dummyCartItemEntity = CartItemEntity(
      productId: 'p1',
      productName: 'Test Product',
      productImage: 'https://example.com/image.png',
      productDescription: 'A test product',
      quantity: 1,
      price: 100.0,
    );

    // Create a CartApiModel and its corresponding CartEntity.
    const cartApiModel = CartApiModel(
      userId: '123',
      items: [dummyCartItemApiModel],
    );

    const cartEntity = CartEntity(
      userId: '123',
      items: [dummyCartItemEntity],
    );


    testWidgets('fromEntity should convert CartEntity to CartApiModel correctly', (tester) async {
      // Act
      final model = CartApiModel.fromEntity(cartEntity);
      // Assert
      expect(model.userId, cartEntity.userId);
      expect(model.items, cartApiModel.items);
    });
  });
}
