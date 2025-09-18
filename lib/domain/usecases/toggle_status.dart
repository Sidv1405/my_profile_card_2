import 'package:my_profile_card/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class ToggleStatus {
  final UserRepository _userRepository;

  ToggleStatus(this._userRepository);

  Future<User> changeStatus(User user){
    return _userRepository.toggleStatus(user);
  }
}
