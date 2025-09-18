import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  final VoidCallback onToggle;

  const ProfileCard({super.key, required this.user, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
                leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: ClipOval(
            child: Image.network(
              user.image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 40, color: Colors.grey),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 40,
                  height: 40,
                                    child: Center(child: const CircularProgressIndicator(strokeWidth: 2)),
                );
              },
            ),
          ),
        ),
        title: Text("${user.name} (${user.phone})"),
        subtitle: Text(user.jobTitle),
        trailing: Switch(value: user.isActive, onChanged: (_) => onToggle()),
      ),
    );
  }
}
