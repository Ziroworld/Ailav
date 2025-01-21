import 'package:dartz/dartz.dart';
import 'package:ailav/core/error/failure.dart';

abstract interface class UsecaseWithParams<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract class UsecaseWithoutParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}

