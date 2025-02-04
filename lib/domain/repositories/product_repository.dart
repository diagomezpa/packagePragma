import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> fetchProducts();
  Future<Either<Failure, Product>> fetchProductById(int id);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(int id, Product product);
  Future<Either<Failure, Product>> deleteProduct(int id);
}
