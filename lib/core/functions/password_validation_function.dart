import '../strings/consts.dart';

String passwordValidationFunction(String? value) {
  if (value!.length < 6) {
    return 'Password must be more than 6 characters';
  } else if (value.length > 20) {
    return 'Password should not be more than 20 characters ';
  } else if (!RegExp(VALIDATION_UPPERCASE_PASSWORD).hasMatch(value)) {
    return 'Password must has upper case characters';
  } else if (!RegExp(VALIDATION_LOWER_CASE_PASSWORD).hasMatch(value)) {
    return 'Password must has lower case characters';
  } else if (!RegExp(VALIDATION_DIGIT_PASSWORD).hasMatch(value)) {
    return 'Password must has at least one digit';
  } else if (!RegExp(VALIDAT_SPECIAL_CHARACTER_PASSWORD).hasMatch(value)) {
    return 'Password must has special character like @#\$%^&*()';
  } else {
    return '';
  }
}
