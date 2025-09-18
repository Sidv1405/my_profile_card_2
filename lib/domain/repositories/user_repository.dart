import 'package:my_profile_card/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
  Future<User> toggleStatus(User user);
}
