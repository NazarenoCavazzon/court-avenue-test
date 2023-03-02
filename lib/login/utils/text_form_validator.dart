import 'package:courtavenue/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Returns a [String] if the [value] is empty, otherwise returns `null`.
String? textFormValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return context.l10n.textFormFieldEmptyError;
  }
  return null;
}
