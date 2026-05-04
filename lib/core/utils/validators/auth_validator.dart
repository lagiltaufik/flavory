class AuthValidator {
  AuthValidator._();
  static final regex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is empty';
    }

    if (!regex.hasMatch(value.trim())) {
      return 'Only Latin letters allowed';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is empty';
    }

    return null;
  }
}
