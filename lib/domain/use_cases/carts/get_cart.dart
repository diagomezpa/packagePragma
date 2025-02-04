import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/cart_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';

class GetCart {
  final CartRepository cartRepository;

  GetCart(this.cartRepository);

  Future<Either<Failure, Cart>> call(int id) async {
    return await cartRepository.fetchCartById(id);
  }
}
