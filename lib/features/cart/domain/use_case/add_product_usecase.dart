import 'package:ailav/app/usecase/usecase.dart';
import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddProductParams extends Equatable {
  final String productId;
  final String userId;
  final String productName;

  final double productPrice;
  final int productQuantity;

  const AddProductParams(
      {required this.productId,
      required this.userId,
      required this.productName,
      required this.productPrice,
      required this.productQuantity});

  @override
  List<Object?> get props => [productId, userId, productQuantity];
}

class AddProductUsecase implements UsecaseWithParams<void, AddProductParams> {
  final ICartRepository _repository;

  AddProductUsecase({required ICartRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, void>> call(AddProductParams params) async {
    final result = await _repository.addProductToCart(
      CartItemEntity(
        productId: params.productId,
        productName: params.productName,
        productImage: '',
        productDescription: '',
        quantity: params.productQuantity,
        price: params.productPrice,
      ),
      
    );

    return result;
  }
}
