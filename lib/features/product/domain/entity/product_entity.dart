import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productId;
  final String name;
  final int price;
  final int stock;
  final String category;
  final String longDescription;
  final String additionalInfo;
  final String imageUrl;

  const ProductEntity({
    this.productId,
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    required this.longDescription,
    required this.additionalInfo,
    required this.imageUrl,
  });

  const ProductEntity.empty()
      : productId = 'empty.id',
        name = 'empty.name',
        price = 0,
        stock = 0,
        category = 'empty.category',
        longDescription = 'empty.longDescription',
        additionalInfo = 'empty.additionalInfo',
        imageUrl = 'empty.imageUrl';

  @override
  List<Object?> get props => [
        productId,
        name,
        price,
        stock,
        category,
        longDescription,
        additionalInfo,
        imageUrl,
      ];
}
