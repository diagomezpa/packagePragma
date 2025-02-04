import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/cart_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/carts/get_cart.dart';

class UpdateCart {
  final CartRepository cartRepository;
  final GetCart getcart;

  UpdateCart(this.cartRepository, this.getcart);

  Future<Either<Failure, Cart>> call(int id) async {
    final cartOrFailure = await getcart(id);

    return cartOrFailure.fold(
      (failure) => Left(failure),
      (cart) async => await cartRepository.updateCart(id, cart),
    );
  }
}
