import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/presentation/theme/color_schemes.dart';
import 'package:test_assignment_lanars/presentation/theme/custom/input_decoration_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      colorScheme: lightColorScheme,
      inputDecorationTheme: TInputDecorationTheme.light,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: darkColorScheme,
      inputDecorationTheme: TInputDecorationTheme.dark,
    );
  }
}
