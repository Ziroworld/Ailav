import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:ailav/features/cart/domain/use_case/clear_cart_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCartRepository extends Mock implements ICartRepository {}

class FakeClearCartParams extends Fake implements ClearCartParams {}

void main() {
  // Register fallback value for ClearCartParams so that any() works.
  setUpAll(() {
    registerFallbackValue(FakeClearCartParams());
  });

  group('ClearCartUsecase', () {
    late MockCartRepository mockCartRepository;
    late ClearCartUsecase usecase;

    setUp(() {
      mockCartRepository = MockCartRepository();
      usecase = ClearCartUsecase(repository: mockCartRepository);
    });

    const params = ClearCartParams(userId: 'u1');

    test('should call repository.clearCart and return Right(null)', () async {
      // Arrange
      when(() => mockCartRepository.clearCart())
          .thenAnswer((_) async => const Right(null));
      // Act
      final result = await usecase(params);
      // Assert
      expect(result, const Right(null));
      verify(() => mockCartRepository.clearCart()).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
