import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/use_case/add_product_usecase.dart';
import 'package:ailav/features/cart/domain/use_case/clear_cart_usecase.dart';
import 'package:ailav/features/cart/domain/use_case/get_cart_usecase.dart';
import 'package:ailav/features/cart/domain/use_case/remove_product_usecase.dart';
import 'package:ailav/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Dummy failure class.
class ApiFailure extends Failure {
  ApiFailure({required String message}) : super(message: message);
}

/// Mocks for use cases.
class MockAddProductUsecase extends Mock implements AddProductUsecase {}
class MockRemoveProductUsecase extends Mock implements RemoveProductUsecase {}
class MockClearCartUsecase extends Mock implements ClearCartUsecase {}
class MockGetCartUsecase extends Mock implements GetCartUsecase {}

/// Fakes for parameter types.
class FakeGetCartParams extends Fake implements GetCartParams {}
class FakeAddProductParams extends Fake implements AddProductParams {}
class FakeRemoveProductParams extends Fake implements RemoveProductParams {}
class FakeClearCartParams extends Fake implements ClearCartParams {}

void main() {
  // Register fallback values so that any() works.
  setUpAll(() {
    registerFallbackValue(FakeGetCartParams());
    registerFallbackValue(FakeAddProductParams());
    registerFallbackValue(FakeRemoveProductParams());
    registerFallbackValue(FakeClearCartParams());
  });

  group('CartBloc Simplified Test', () {
    late MockAddProductUsecase mockAddProductUsecase;
    late MockRemoveProductUsecase mockRemoveProductUsecase;
    late MockClearCartUsecase mockClearCartUsecase;
    late MockGetCartUsecase mockGetCartUsecase;
    late CartBloc cartBloc;

    // Dummy cart item (using your updated CartItemEntity).
    const dummyCartItem = CartItemEntity(
      productId: 'p1',
      productName: 'Test Product',
      productImage: 'https://example.com/image.png',
      productDescription: 'A test product',
      quantity: 1,
      price: 100.0,
    );

    setUp(() {
      mockAddProductUsecase = MockAddProductUsecase();
      mockRemoveProductUsecase = MockRemoveProductUsecase();
      mockClearCartUsecase = MockClearCartUsecase();
      mockGetCartUsecase = MockGetCartUsecase();

      // Default: getCart returns a list with the dummy item.
      when(() => mockGetCartUsecase.call(any()))
          .thenAnswer((_) async => Right([dummyCartItem]));

      // Create a new CartBloc instance.
      cartBloc = CartBloc(
        addProductUsecase: mockAddProductUsecase,
        removeProductUsecase: mockRemoveProductUsecase,
        clearCartUsecase: mockClearCartUsecase,
        getCartUsecase: mockGetCartUsecase,
      );
    });

    tearDown(() {
      cartBloc.close();
    });

    test('LoadCartEvent loads cart items correctly', () async {
      // Trigger a LoadCartEvent.
      cartBloc.add(const LoadCartEvent(userId: 'rohan123'));
      // Wait a short time for async processing.
      await Future.delayed(const Duration(milliseconds: 50));
      // Expect the final state to have isLoading false and the dummy item loaded.
      expect(cartBloc.state.isLoading, false);
      expect(cartBloc.state.items, [dummyCartItem]);
    });
  });
}
