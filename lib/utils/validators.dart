class Validators {
  static String? validateRequired(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String value) {
    final email = value.trim();
    if (email.isEmpty) {
      return 'Email is required';
    }

    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!regex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? validatePhone(String value) {
    final phone = value.trim();
    if (phone.isEmpty) {
      return 'Phone number is required';
    }
    if (phone.length < 9) {
      return 'Phone number is too short';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
