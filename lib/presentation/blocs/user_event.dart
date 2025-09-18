import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsers extends UserEvent {}

class ToggleUserStatus extends UserEvent {
  final User user;

  const ToggleUserStatus(this.user);

  @override
  List<Object?> get props => [user];
}
