// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemApiModel _$CartItemApiModelFromJson(Map<String, dynamic> json) =>
    CartItemApiModel(
      productId: json['_id'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$CartItemApiModelToJson(CartItemApiModel instance) =>
    <String, dynamic>{
      '_id': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'quantity': instance.quantity,
      'price': instance.price,
    };
