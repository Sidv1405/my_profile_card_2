import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final int age;
  final String jobTitle;
  final String image;
  final bool isActive;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.jobTitle,
    required this.image,
    required this.isActive,
  });

  User copyWith({
    String? id,
    String? name,
    int? age,
    String? jobTitle,
    String? image,
    bool? isActive,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      jobTitle: jobTitle ?? this.jobTitle,
      image: image ?? this.image,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [id, name, age, jobTitle, image, isActive];
}
