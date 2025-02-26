import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/data/data_source/cart_datasource.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRemoteRepository implements ICartRepository {
  final CartDatasource _cartDatasource;

  CartRemoteRepository({required CartDatasource cartDatasource})
      : _cartDatasource = cartDatasource;
  @override
  Future<Either<Failure, void>> addProductToCart(
      CartItemEntity product, ) async {
    try {
      await _cartDatasource.addProductToCart(product, );
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    try {
      await _cartDatasource.clearCart();
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartItemEntity>>> getCartProducts(
      ) async {
    try {
      final result = await _cartDatasource.getCartProducts();
      return Right(result);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromCart(
      CartItemEntity product, ) async {
    try {
      await _cartDatasource.removeProductFromCart(product, );
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
