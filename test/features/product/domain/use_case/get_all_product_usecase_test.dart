import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ailav/features/product/domain/entity/product_entity.dart';
import 'package:ailav/features/product/domain/use_case/get_all_product_usecase.dart';
import 'package:ailav/features/product/domain/repository/product_repository.dart';

class MockProductRepository extends Mock implements IProductRepository {}

void main() {
  late MockProductRepository repository;
  late GetAllProductUsecase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetAllProductUsecase(productRepository: repository);
  });

  const tProduct = ProductEntity(
    productId: '1',
    name: 'Test Product',
    price: 100,
    stock: 10,
    category: 'Category A',
    longDescription: 'Test long description',
    additionalInfo: 'Test additional info',
    imageUrl: 'https://example.com/image.png',
  );

  final tProducts = [tProduct];

  test('should get products from repository', () async {
    // Arrange
    when(() => repository.getProducts())
        .thenAnswer((_) async => Right(tProducts));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Right(tProducts));

    // Verify
    verify(() => repository.getProducts()).called(1);
  });
}
