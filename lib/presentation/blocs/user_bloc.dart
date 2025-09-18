import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/user_repository.dart';
import '../../../domain/usecases/toggle_status.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  final ToggleStatus toggleStatusUseCase;

  UserBloc(this.repository)
    : toggleStatusUseCase = ToggleStatus(repository),
      super(UserInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<ToggleUserStatus>(_onToggleUserStatus);
  }

  Future<void> _onLoadUsers(LoadUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await repository.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onToggleUserStatus(
    ToggleUserStatus event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserLoaded) {
      final currentUsers = (state as UserLoaded).users;
      try {
        final updatedUser = await toggleStatusUseCase.changeStatus(
          event.user.id,
          !event.user.isActive,
        );
        final updatedList = currentUsers
            .map((u) => u.id == updatedUser.id ? updatedUser : u)
            .toList();
        emit(UserLoaded(updatedList));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    }
  }
}
