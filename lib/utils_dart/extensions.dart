extension StringExtension on String {
  bool get isValidName {
    final nameRegExp =
    RegExp(r'[a-z]');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'[0-9]');
    return phoneRegExp.hasMatch(this);
  }
}