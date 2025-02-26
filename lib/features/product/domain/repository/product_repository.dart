
import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/product/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}