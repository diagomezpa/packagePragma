import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/cart_repository.dart';

class CreateCart {
  final CartRepository repository;

  CreateCart(this.repository);

  Future<Either<Failure, Cart>> call(Cart cart) async {
    return await repository.createCart(cart);
  }
}
