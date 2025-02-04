import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/product_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/product.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, Product>> call(int id) async {
    return await repository.fetchProductById(id);
  }
}
