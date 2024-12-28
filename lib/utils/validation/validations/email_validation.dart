import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/utils/validation/validation.dart';

class EmailValidation<T> extends Validation<T> {
  final int minLength;
  final int maxLength;

  const EmailValidation({this.minLength = 6, this.maxLength = 30});

  @override
  String? validate(BuildContext context, T? value) {
    if (value is! String) {
      return 'Email is incorrect';
    }

    final email = value.trim();
    final regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'+\\/=?^_`{|}~-]{1,10}@(?:(?!.-)[a-zA-Z0-9-]{1,10}(?<!-))(?:\.(?:[a-zA-Z0-9-]{2,10}))+$",
    );

    if (email.length < minLength || email.length > maxLength) {
      return 'Should be between $minLength and $maxLength characters';
    }

    if (!regex.hasMatch(email)) {
      return 'Email is incorrect';
    }

    return null;
  }
}
