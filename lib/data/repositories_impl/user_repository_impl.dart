import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../mappers/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    final models = await remoteDataSource.fetchUsers();
    return models.map((m) => UserMapper.toEntity(m)).toList();
  }

  @override
  Future<User> toggleStatus(String id, bool isActive) async {
    final model = await remoteDataSource.updateUserStatus(id, isActive);
    return UserMapper.toEntity(model);
  }
}
