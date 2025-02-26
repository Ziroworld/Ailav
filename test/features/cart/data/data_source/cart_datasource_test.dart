import 'package:ailav/app/constants/api_endpoints.dart';
import 'package:ailav/app/shared_prefs/user_shared_prefs.dart';
import 'package:ailav/features/cart/data/data_source/cart_datasource.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}
class MockUserSharedPrefs extends Mock implements UserSharedPrefs {}

void main() {
  late MockDio mockDio;
  late MockUserSharedPrefs mockUserSharedPrefs;
  late CartDatasource datasource;

  // Dummy user id.
  const dummyUserId = "testUser123";

  setUp(() {
    mockDio = MockDio();
    mockUserSharedPrefs = MockUserSharedPrefs();
    datasource = CartDatasource(dio: mockDio, userSharedPrefs: mockUserSharedPrefs);
  });

  group('CartDatasource', () {
    testWidgets('sharedPrefUserId returns user id from shared prefs', (tester) async {
      // Arrange: simulate shared prefs returning Right(dummyUserId)
      when(() => mockUserSharedPrefs.getUserId())
          .thenAnswer((_) async => const Right(dummyUserId));
      // Act
      final result = await datasource.sharedPrefUserId();
      // Assert
      expect(result, dummyUserId);
    });

    testWidgets('addProductToCart succeeds when response status is 200', (tester) async {
      // Arrange
      when(() => mockUserSharedPrefs.getUserId())
          .thenAnswer((_) async => const Right(dummyUserId));
      when(() => mockDio.post(ApiEndpoints.addProductToCart, data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                data: {},
                statusCode: 200,
                requestOptions: RequestOptions(path: ApiEndpoints.addProductToCart),
              ));
      const dummyProduct = CartItemEntity(
        productId: 'p1',
        productName: 'Test Product',
        productImage: 'https://example.com/image.png',
        productDescription: 'A test product',
        quantity: 1,
        price: 100.0,
      );
      // Act
      await datasource.addProductToCart(dummyProduct);
      // Assert: if no exception thrown, the test passes.
      verify(() => mockDio.post(ApiEndpoints.addProductToCart, data: any(named: 'data'))).called(1);
    });

    testWidgets('removeProductFromCart succeeds when response status is 200', (tester) async {
      // Arrange
      when(() => mockUserSharedPrefs.getUserId())
          .thenAnswer((_) async => const Right(dummyUserId));
      when(() => mockDio.post(ApiEndpoints.removeProductFromCart, data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                data: {},
                statusCode: 200,
                requestOptions: RequestOptions(path: ApiEndpoints.removeProductFromCart),
              ));
      const dummyProduct = CartItemEntity(
        productId: 'p1',
        productName: 'Test Product',
        productImage: 'https://example.com/image.png',
        productDescription: 'A test product',
        quantity: 1,
        price: 100.0,
      );
      // Act
      await datasource.removeProductFromCart(dummyProduct);
      // Assert
      verify(() => mockDio.post(ApiEndpoints.removeProductFromCart, data: any(named: 'data'))).called(1);
    });

    testWidgets('clearCart succeeds when response status is 200', (tester) async {
      // Arrange
      when(() => mockUserSharedPrefs.getUserId())
          .thenAnswer((_) async => const Right(dummyUserId));
      when(() => mockDio.post(ApiEndpoints.clearCart, data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                data: {},
                statusCode: 200,
                requestOptions: RequestOptions(path: ApiEndpoints.clearCart),
              ));
      // Act
      await datasource.clearCart();
      // Assert
      verify(() => mockDio.post(ApiEndpoints.clearCart, data: any(named: 'data'))).called(1);
    });

   
  });
}
