import 'package:flutter/material.dart';

class TInputDecorationTheme {
  const TInputDecorationTheme._();

  static InputDecorationTheme get light => _baseTheme();

  static InputDecorationTheme get dark => _baseTheme();

  static InputDecorationTheme _baseTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      hintStyle: const TextStyle(
        fontSize: 16,
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
      ),
      floatingLabelStyle: const TextStyle(
        fontSize: 12,
      ),
      errorStyle: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
