import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_bloc.dart';
import 'package:test_assignment_lanars/data/models/user_profile.dart';
import 'package:test_assignment_lanars/presentation/widgets/icon_drawer_button.dart';
import 'package:test_assignment_lanars/presentation/widgets/list_photo_groups.dart';
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
        title: Text('List page'),
        centerTitle: true,
      ),
      drawer: ProfileDrawer(userProfile: userProfile),
      body: BlocProvider(
        create: (context) => PhotoBloc(context),
        child: ListPhotoGroups(),
      ),
    );
  }
}
