class UserModel {
  final String id;
  final String name;
  final String phone;
  final String jobTitle;
  final String image;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.jobTitle,
    required this.image,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      phone: json['phone']?.toString() ?? '',
      jobTitle: json['jobTitle'] ?? '',
      image: json['image'] ?? '',
      isActive: json['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'jobTitle': jobTitle,
      'image': image,
      'isActive': isActive,
    };
  }
}
