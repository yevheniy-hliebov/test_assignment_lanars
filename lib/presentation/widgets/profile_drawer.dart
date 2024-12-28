import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/data/models/user_profile.dart';
import 'package:test_assignment_lanars/presentation/widgets/chage_theme_tile.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
    required this.userProfile,
  });

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 24, left: 12, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: SizedBox(
                width: 56,
                height: 56,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userProfile.avatar),
                ),
              ),
              title: Text(
                userProfile.name.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                userProfile.email,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Spacer(),
            ChangeThemeTile(),
          ],
        ),
      ),
    );
  }
}
