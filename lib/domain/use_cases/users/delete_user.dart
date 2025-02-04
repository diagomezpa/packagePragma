import 'package:dartz/dartz.dart';
import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/user.dart';
import 'package:fake_maker_api_pragma_api/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<Failure, User>> call(int id) async {
    return await repository.deleteUser(id);
  }
}
