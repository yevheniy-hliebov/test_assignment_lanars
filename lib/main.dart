import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/presentation/screens/main_screen.dart';
import 'package:test_assignment_lanars/presentation/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Assignment LANARS',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const MainScreen(),
    );
  }
}
