import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/user.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/user_repository.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/users/get_user.dart';

class UpdateUser {
  final UserRepository repository;
  final GetUser getUser;
  UpdateUser(this.repository, this.getUser);
  Future<Either<Failure, User>> call(int id) {
    final userOrFailure = getUser(id);
    return userOrFailure.then((userOrFailure) async {
      return userOrFailure.fold((failure) => Left(failure), (user) async {
        return await repository.updateUser(id, user);
      });
    });
  }
}
