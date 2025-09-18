import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile_card/presentation/blocs/user_bloc.dart';
import 'package:my_profile_card/presentation/profile_page.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'data/repositories_impl/user_repository_impl.dart';

void main() {
  final repository = UserRepositoryImpl(UserRemoteDataSource());

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final UserRepositoryImpl repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile Card',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => UserBloc(repository),
        child: const ProfilePage(),
      ),
    );
  }
}
