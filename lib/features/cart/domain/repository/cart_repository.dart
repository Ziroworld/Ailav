import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ICartRepository {
  Future<Either<Failure, void>> addProductToCart(
    CartItemEntity product,
  );
  Future<Either<Failure, void>> removeProductFromCart(
    CartItemEntity product,
  );
  Future<Either<Failure, void>> clearCart();
  Future<Either<Failure, List<CartItemEntity>>> getCartProducts();
}
