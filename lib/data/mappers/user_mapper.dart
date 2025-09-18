import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class UserMapper {
  static User toEntity(UserModel model) {
    return User(
      id: model.id,
      name: model.name,
      phone: model.phone,
      jobTitle: model.jobTitle,
      image: model.image,
      isActive: model.isActive,
    );
  }

  static UserModel toModel(User entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      jobTitle: entity.jobTitle,
      image: entity.image,
      isActive: entity.isActive,
    );
  }
}
