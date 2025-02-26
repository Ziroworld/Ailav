import 'package:ailav/core/error/failure.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ailav/features/product/presentation/view_model/product_bloc.dart';
import 'package:ailav/features/product/domain/use_case/get_all_product_usecase.dart';
import 'package:ailav/features/product/domain/entity/product_entity.dart';

class ApiFailure extends Failure {
  ApiFailure({required String message}) : super(message: message);
}

class MockGetAllProductUsecase extends Mock implements GetAllProductUsecase {}

void main() {
  late MockGetAllProductUsecase mockGetAllProductUsecase;

  // Sample products using the full ProductEntity fields.
  const product1 = ProductEntity(
    productId: '1',
    name: 'Product 1',
    price: 100,
    stock: 10,
    category: 'Category 1',
    longDescription: 'Long description for product 1',
    additionalInfo: 'Additional info for product 1',
    imageUrl: 'https://example.com/product1.png',
  );

  const product2 = ProductEntity(
    productId: '2',
    name: 'Product 2',
    price: 200,
    stock: 20,
    category: 'Category 2',
    longDescription: 'Long description for product 2',
    additionalInfo: 'Additional info for product 2',
    imageUrl: 'https://example.com/product2.png',
  );

  final productsList = [product1, product2];

  setUp(() {
    mockGetAllProductUsecase = MockGetAllProductUsecase();
  });

  group('ProductBloc', () {
    blocTest<ProductBloc, ProductState>(
      'emits loaded products when LoadProducts is successful',
      build: () {
        when(() => mockGetAllProductUsecase.call())
            .thenAnswer((_) async => Right(productsList));
        return ProductBloc(getAllProductUsecase: mockGetAllProductUsecase);
      },
      expect: () => [
        ProductState.initial().copyWith(isLoading: true),
        ProductState.initial().copyWith(
          isLoading: false,
          products: productsList,
          error: null,
        ),
      ],
      verify: (_) {
        verify(() => mockGetAllProductUsecase.call()).called(1);
      },
    );

    blocTest<ProductBloc, ProductState>(
      'emits error when LoadProducts fails',
      build: () {
        when(() => mockGetAllProductUsecase.call())
            .thenAnswer((_) async => Left(ApiFailure(message: 'Error')));
        return ProductBloc(getAllProductUsecase: mockGetAllProductUsecase);
      },
      expect: () => [
        ProductState.initial().copyWith(isLoading: true),
        ProductState.initial().copyWith(
          isLoading: false,
          error: 'Error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetAllProductUsecase.call()).called(1);
      },
    );
  });
}
