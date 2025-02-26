import 'package:ailav/app/usecase/usecase.dart';
import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCartParams extends Equatable {
  final String userId;

  const GetCartParams({
    required this.userId,
  });

  @override
  List<Object?> get props => [
        userId,
      ];
}

class GetCartUsecase
    implements UsecaseWithParams<List<CartItemEntity>, GetCartParams> {
  final ICartRepository _repository;

  GetCartUsecase({required ICartRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<CartItemEntity>>> call(
      GetCartParams params) async {
    final result = await _repository.getCartProducts(
      
    );

    return result;
  }
}
