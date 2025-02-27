import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:ailav/features/cart/domain/use_case/add_product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Dummy failure class.
class ApiFailure extends Failure {
  ApiFailure({required String message}) : super(message: message);
}

// Mocks for repository.
class MockCartRepository extends Mock implements ICartRepository {}

// Fakes for parameter types.
class FakeCartItemEntity extends Fake implements CartItemEntity {}
class FakeAddProductParams extends Fake implements AddProductParams {}

void main() {
  // Register fallback values for types used with any().
  setUpAll(() {
    registerFallbackValue(FakeCartItemEntity());
    registerFallbackValue(FakeAddProductParams());
  });

  group('AddProductUsecase Test', () {
    late MockCartRepository mockCartRepository;
    late AddProductUsecase usecase;

    setUp(() {
      mockCartRepository = MockCartRepository();
      usecase = AddProductUsecase(repository: mockCartRepository);
    });

    const params = AddProductParams(
      productId: 'p1',
      userId: 'u1',
      productName: 'Test Product',
      productPrice: 100.0,
      productQuantity: 1,
    );

    test('should call repository.addProductToCart and return Right(null)', () async {
      // Arrange
      when(() => mockCartRepository.addProductToCart(any()))
          .thenAnswer((_) async => Right(null));
      // Act
      final result = await usecase(params);
      // Assert
      expect(result, Right(null));
      verify(() => mockCartRepository.addProductToCart(any())).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
