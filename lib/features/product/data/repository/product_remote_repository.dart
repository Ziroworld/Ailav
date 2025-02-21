import 'package:ailav/core/error/failure.dart';
import 'package:ailav/features/product/data/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:ailav/features/product/domain/entity/product_entity.dart';
import 'package:ailav/features/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRemoteRepository implements IProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRemoteRepository({required this.remoteDataSource});
  
   @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
