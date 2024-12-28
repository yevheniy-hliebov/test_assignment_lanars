import 'package:flutter/material.dart';

sealed class ThemeEvent {}

final class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode selectedThemeMode;

  ChangeThemeEvent({required this.selectedThemeMode});
}
