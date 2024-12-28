import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/utils/validation/validation.dart';

class PasswordValidation<T> extends Validation<T> {
  final int minLength;
  final int maxLength;

  const PasswordValidation({this.minLength = 6, this.maxLength = 10});

  @override
  String? validate(BuildContext context, T? value) {
    if (value is! String) {
      return 'Password is incorrect';
    }

    if (value.length < minLength || value.length > maxLength) {
      return 'Should be between $minLength and $maxLength characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    return null;
  }
}
