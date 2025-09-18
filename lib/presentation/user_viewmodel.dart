import 'package:flutter/foundation.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/toggle_status.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository repository;
  final ToggleStatus toggleStatusUseCase;

  UserViewModel({required this.repository})
    : toggleStatusUseCase = ToggleStatus(repository);

  List<User> _users = [];

  List<User> get users => _users;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    _users = await repository.getUsers();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleStatus(User user) async {
    final updatedUser = await toggleStatusUseCase.changeStatus(
      user.id,
      !user.isActive,
    );
    _users = _users
        .map((u) => u.id == updatedUser.id ? updatedUser : u)
        .toList();
    notifyListeners();
  }
}
