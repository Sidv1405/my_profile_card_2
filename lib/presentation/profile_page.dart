import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_profile_card/presentation/profile_card.dart';

import 'blocs/user_bloc.dart';
import 'blocs/user_event.dart';
import 'blocs/user_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile Card")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            context.read<UserBloc>().add(LoadUsers());
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ProfileCard(
                  user: user,
                  onToggle: () {
                    context.read<UserBloc>().add(ToggleUserStatus(user));
                  },
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserBloc>().add(LoadUsers()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
