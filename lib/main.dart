import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/theme/theme_bloc.dart';
import 'package:test_assignment_lanars/presentation/router/router.dart';
import 'package:test_assignment_lanars/presentation/theme/theme.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeModeState) {
        return MaterialApp.router(
          title: 'Test Assignment LANARS',
          themeMode: themeModeState,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
