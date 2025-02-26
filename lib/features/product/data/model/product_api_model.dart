import 'package:ailav/features/product/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_api_model.g.dart';

// Generate the Equatable code
//dart run build_runner build -d

@JsonSerializable()
class ProductApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? productId;
  final String name;
  final int price;
  final int stock;
  final String category;
  final String longDescription;
  final String additionalInfo;
  final String imageUrl;

  const ProductApiModel({
    this.productId,
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    required this.longDescription,
    required this.additionalInfo,
    required this.imageUrl,
  });

  const ProductApiModel.empty()
      : productId = '',
        name = '',
        price = 0,
        stock = 0,
        category = '',
        longDescription = '',
        additionalInfo = '',
        imageUrl = '';

  // From Json - full code without generator
  factory ProductApiModel.fromJson(Map<String, dynamic> json) {
    return ProductApiModel(
      productId: json['_id'] as String?,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      category: json['category'] as String,
      longDescription: json['longDescription'] as String,
      additionalInfo: json['additionalInfo'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  // To Json - full code without generator
  Map<String, dynamic> toJson() {
    return {
      '_id': productId,
      'name': name,
      'price': price,
      'stock': stock,
      'category': category,
      'longDescription': longDescription,
      'additionalInfo': additionalInfo,
      'imageUrl': imageUrl,
    };
  }

  // Convert API Object to Entity
  ProductEntity toEntity() => ProductEntity(
        productId: productId,
        name: name,
        price: price,
        stock: stock,
        category: category,
        longDescription: longDescription,
        additionalInfo: additionalInfo,
        imageUrl: imageUrl,
      );

  // Convert Entity to API Object
  static ProductApiModel fromEntity(ProductEntity entity) => ProductApiModel(
        productId: entity.productId,
        name: entity.name,
        price: entity.price,
        stock: entity.stock,
        category: entity.category,
        longDescription: entity.longDescription,
        additionalInfo: entity.additionalInfo,
        imageUrl: entity.imageUrl,
      );

  // Convert API List to Entity List
  static List<ProductEntity> toEntityList(List<ProductApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

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
