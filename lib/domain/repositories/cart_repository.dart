import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> fetchCarts();
  Future<Either<Failure, Cart>> fetchCartById(int id);
  Future<Either<Failure, Cart>> createCart(Cart cart);
  Future<Either<Failure, Cart>> updateCart(int id, Cart cart);
  Future<Either<Failure, Cart>> deleteCart(int id);
}
