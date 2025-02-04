import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/cart_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';

class DeleteCart {
  final CartRepository repository;

  DeleteCart(this.repository);

  Future<Either<Failure, Cart>> call(int cartId) async {
    return await repository.deleteCart(cartId);
  }
}
