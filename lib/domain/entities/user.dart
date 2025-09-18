import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String jobTitle;
  final String image;
  final bool isActive;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.jobTitle,
    required this.image,
    required this.isActive,
  });

  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? jobTitle,
    String? image,
    bool? isActive,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      jobTitle: jobTitle ?? this.jobTitle,
      image: image ?? this.image,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [id, name, phone, jobTitle, image, isActive];
}
