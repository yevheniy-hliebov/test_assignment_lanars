import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/presentation/theme/color_schemes.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      colorScheme: lightColorScheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: darkColorScheme,
    );
  }
}
