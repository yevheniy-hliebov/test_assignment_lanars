import 'package:flutter/material.dart';

class GroupLetter extends StatelessWidget {
  final String letter;

  const GroupLetter({required this.letter, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      letter,
      style: textTheme.titleMedium?.copyWith(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
