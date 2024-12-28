// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test_assignment_lanars/data/models/user_profile.dart' as _i5;
import 'package:test_assignment_lanars/presentation/screens/login_screen.dart'
    as _i1;
import 'package:test_assignment_lanars/presentation/screens/main_screen.dart'
    as _i2;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i3.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i4.Key? key,
    required _i5.UserProfile userProfile,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            userProfile: userProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i2.MainScreen(
        key: args.key,
        userProfile: args.userProfile,
      );
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.userProfile,
  });

  final _i4.Key? key;

  final _i5.UserProfile userProfile;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, userProfile: $userProfile}';
  }
}
