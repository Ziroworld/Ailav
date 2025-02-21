import 'package:ailav/app/usecase/usecase.dart';
import 'package:ailav/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ailav/features/product/domain/entity/product_entity.dart';
import 'package:ailav/features/product/domain/repository/product_repository.dart';

class GetAllProductUsecase implements UsecaseWithoutParams<List<ProductEntity>> {
  final IProductRepository productRepository;

  GetAllProductUsecase({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() {
    return productRepository.getProducts();
  }
}
