import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/error/exceptions.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final String baseUrl = "https://68cc21d2716562cf50768cde.mockapi.io/api/v1";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw ServerException("Failed to fetch users");
    }
  }

  Future<UserModel> updateUserStatus(String id, bool isActive) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'isActive': isActive}),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException("Failed to update user");
    }
  }
}
