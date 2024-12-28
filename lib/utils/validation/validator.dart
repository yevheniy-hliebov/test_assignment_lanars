import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/utils/validation/validation.dart';

class Validator {
  const Validator._();

  static FormFieldValidator<T> apply<T>(
    BuildContext context,
    List<Validation<T>> validations,
  ) {
    return (T? value) {
      for (final validation in validations) {
        final error = validation.validate(context, value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> applyOne<T>(
    BuildContext context,
    Validation<T> validation,
  ) {
    return (T? value) => validation.validate(context, value);
  }
}
