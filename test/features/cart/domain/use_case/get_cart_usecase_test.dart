import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:ailav/features/cart/domain/use_case/get_cart_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCartRepository extends Mock implements ICartRepository {}

class FakeGetCartParams extends Fake implements GetCartParams {}

void main() {
  // Register fallback value for GetCartParams so that any() works.
  setUpAll(() {
    registerFallbackValue(FakeGetCartParams());
  });

  group('GetCartUsecase', () {
    late MockCartRepository mockCartRepository;
    late GetCartUsecase usecase;

    // Dummy list of cart items.
    final dummyCartItems = [
      const CartItemEntity(
        productId: 'p1',
        productName: 'Test Product',
        productImage: 'https://example.com/image.png',
        productDescription: 'A test product',
        quantity: 1,
        price: 100.0,
      )
    ];

    setUp(() {
      mockCartRepository = MockCartRepository();
      usecase = GetCartUsecase(repository: mockCartRepository);
      // When the repository is called, return our dummy list.
      when(() => mockCartRepository.getCartProducts())
          .thenAnswer((_) async => Right(dummyCartItems));
    });

    const params = GetCartParams(userId: 'rohan123');

    test(
        'should call repository.getCartProducts and return a list of cart items',
        () async {
      // Act
      final result = await usecase(params);
      // Assert
      expect(result, Right(dummyCartItems));
      verify(() => mockCartRepository.getCartProducts()).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
