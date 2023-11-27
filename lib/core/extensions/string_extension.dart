extension StringExtension on String {
  bool get isValidEmail {
    final emailRegularExpression = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegularExpression.hasMatch(this);
  }

  bool isEqual(String value) {
    if (this == value) {
      return true;
    } else {
      return false;
    }
  }

  bool isNotEqual(String value) {
    if (this != value) {
      return true;
    } else {
      return false;
    }
  }
}
