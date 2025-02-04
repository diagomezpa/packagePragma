import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/product.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.createProduct(product);
  }
}
