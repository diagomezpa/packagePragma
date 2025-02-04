import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/product.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/product_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/products/get_product.dart';

class UpdateProduct {
  final ProductRepository repository;
  final GetProduct getProduct;

  UpdateProduct(this.repository, this.getProduct);

  Future<Either<Failure, Product>> call(int id) async {
    final productOrFailure = await getProduct(id);
    return productOrFailure.fold(
      (failure) => Left(failure),
      (product) async => await repository.updateProduct(id, product),
    );
  }
}
