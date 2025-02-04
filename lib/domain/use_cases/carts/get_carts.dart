import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/cart_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';

class GetCarts {
  final CartRepository repository;

  GetCarts(this.repository);

  Future<Either<Failure, List<Cart>>> call() async {
    return await repository.fetchCarts();
  }
}
