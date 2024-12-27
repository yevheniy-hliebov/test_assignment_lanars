import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/theme/theme_bloc.dart';
import 'package:test_assignment_lanars/presentation/screens/main_screen.dart';
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
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeModeState) {
        return MaterialApp(
          title: 'Test Assignment LANARS',
          themeMode: themeModeState,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: const MainScreen(),
        );
      },
    );
  }
}
