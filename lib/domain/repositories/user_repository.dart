import 'package:my_profile_card/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  Future<User> toggleStatus(String userId, bool isActive);
}
