import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/presentation/widgets/change_theme_dialog.dart';

class ChangeThemeTile extends StatelessWidget {
  const ChangeThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListTile(
        title: Text('Change theme mode'),
        onTap: () => _showThemeDialog(context),
      );
    });
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeThemeDialog();
      },
    );
  }
}
