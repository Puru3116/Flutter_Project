class Validators {
  static final RegExp _emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _passwordReg =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$');

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email required';
    if (!_emailReg.hasMatch(value)) return 'Enter valid email';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password required';
    if (!_passwordReg.hasMatch(value)) {
      return 'Min 8 chars, 1 upper, 1 lower, 1 digit & 1 symbol';
    }
    return null;
  }
}
