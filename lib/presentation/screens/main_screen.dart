import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/data/models/user_profile.dart';
import 'package:test_assignment_lanars/presentation/widgets/icon_drawer_button.dart';
import 'package:test_assignment_lanars/presentation/widgets/profile_drawer.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  final UserProfile userProfile;

  const MainScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconDrawerButton(),
      ),
      drawer: ProfileDrawer(userProfile: userProfile),
    );
  }
}
