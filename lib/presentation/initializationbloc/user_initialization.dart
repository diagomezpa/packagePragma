import 'package:fake_maker_api_pragma_api/data/data_sources/api_client.dart';
import 'package:fake_maker_api_pragma_api/data/repositories/user_repository_impl.dart';
import 'package:fake_maker_api_pragma_api/presentation/blocs/user_bloc.dart';

import '../../domain/use_cases/users/create_user.dart';
import '../../domain/use_cases/users/delete_user.dart';
import '../../domain/use_cases/users/get_user.dart';
import '../../domain/use_cases/users/get_users.dart';
import '../../domain/use_cases/users/update_user.dart';

UserBloc initializeUserBloc(void Function(dynamic userOrUsers) onUserLoaded) {
  final userRepository = UserRepositoryImpl(apiClient: ApiClient());
  final getUsers = GetUsers(userRepository);
  final getUser = GetUser(userRepository);
  final deleteUser = DeleteUser(userRepository);
  final createUser = CreateUser(userRepository);
  final updateUser = UpdateUser(userRepository, getUser);

  final userBloc =
      UserBloc(getUsers, getUser, deleteUser, createUser, updateUser);

  userBloc.state.listen((state) {
    if (state is UserLoading) {
      print('Loading users...');
    } else if (state is UsersLoaded) {
      onUserLoaded(state.users);
    } else if (state is UserLoaded) {
      onUserLoaded(state.user);
    } else if (state is UserDeleted) {
      onUserLoaded(state.user);
    } else if (state is UserCreated) {
      onUserLoaded(state.user);
    } else if (state is UserUpdated) {
      onUserLoaded(state.user);
    } else if (state is UserError) {
      print('Error: ${state.message}');
    }
  });

  return userBloc;
}
