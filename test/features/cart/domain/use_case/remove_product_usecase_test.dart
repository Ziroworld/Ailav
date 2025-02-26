import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:ailav/features/cart/domain/use_case/remove_product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Dummy failure class.
class ApiFailure extends Failure {
  ApiFailure({required String message}) : super(message: message);
}

/// Mock for the CartRepository.
class MockCartRepository extends Mock implements ICartRepository {}

/// Fake for CartItemEntity so that using any() for its parameter works.
class FakeCartItemEntity extends Fake implements CartItemEntity {}

void main() {
  // Register fallback value for CartItemEntity.
  setUpAll(() {
    registerFallbackValue(FakeCartItemEntity());
  });

  group('RemoveProductUsecase', () {
    late MockCartRepository mockCartRepository;
    late RemoveProductUsecase usecase;

    setUp(() {
      mockCartRepository = MockCartRepository();
      usecase = RemoveProductUsecase(repository: mockCartRepository);
    });

    const params = RemoveProductParams(
      productId: 'p1',
      userId: 'u1',
      productName: 'Test Product',
      productPrice: 100.0,
      productQuantity: 1,
    );

    test('should call repository.removeProductFromCart and return Right(null)', () async {
      // Arrange
      when(() => mockCartRepository.removeProductFromCart(any()))
          .thenAnswer((_) async => const Right(null));
      // Act
      final result = await usecase(params);
      // Assert
      expect(result, const Right(null));
      verify(() => mockCartRepository.removeProductFromCart(
        // We expect the repository to be called with a CartItemEntity constructed using the params.
        any(that: predicate<CartItemEntity>((cartItem) {
          return cartItem.productId == params.productId &&
                 cartItem.productName == params.productName &&
                 cartItem.quantity == params.productQuantity &&
                 cartItem.price == params.productPrice &&
                 cartItem.productImage == '' &&
                 cartItem.productDescription == '';
        })),
      )).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
