
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/theme/theme_bloc.dart';
import 'package:test_assignment_lanars/bloc/theme/theme_event.dart';


class ChangeThemeDialog extends StatelessWidget {
  const ChangeThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeMode>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          title: Text('Change theme mode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.map((themeMode) {
              return ListTile(
                title: Text(_getThemeModeString(context, themeMode)),
                onTap: () => _changeMode(context, themeMode),
                selected: themeMode == state,
              );
            }).toList(),
          ),
          actions: _buildActions(context),
        );
      },
    );
  }

  String _getThemeModeString(BuildContext context, ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  void _changeMode(BuildContext context, ThemeMode themeMode) {
    context.read<ThemeBloc>().add(
          ChangeThemeEvent(selectedThemeMode: themeMode),
        );
    Navigator.of(context).pop();
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('Cancel'),
      ),
    ];
  }
}
