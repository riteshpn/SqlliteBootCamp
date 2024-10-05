import 'package:widgets_responsive/local_database/string_constant.dart';

class ValidationHelper {
  static String? validateName(String? value) {
    // Check for null or empty
    if (value == null || value.isEmpty) {
      return StringConstants.nameError;
    }

    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

    if (!nameRegExp.hasMatch(value)) {
      return StringConstants.nameError;
    }

    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.ageError;
    }
    int? age = int.tryParse(value);
    if (age == null || age < 0) {
      return StringConstants.ageError;
    } else if (age > 100) {
      return StringConstants.ageLimitError;
    }
    return null;
  }
}
