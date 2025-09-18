import 'package:my_profile_card/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class ToggleStatus {
  final UserRepository _userRepository;

  ToggleStatus(this._userRepository);

  Future<User> changeStatus(String userId, bool isActive) async {
    return _userRepository.toggleStatus(userId, isActive);
  }
}
