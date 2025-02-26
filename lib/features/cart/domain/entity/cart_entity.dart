import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String userId;
  final List<CartItemEntity> items;

  const CartEntity({
    required this.userId,
    required this.items,
  });

  const CartEntity.empty()
      : userId = '',
        items = const [];

  @override
  List<Object?> get props => [userId, items];
}


