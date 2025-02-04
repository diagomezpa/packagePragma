import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/product_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/product.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.fetchProducts();
  }
}
