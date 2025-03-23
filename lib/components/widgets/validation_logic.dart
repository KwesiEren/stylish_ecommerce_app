class ValidationClass {
  String? validateEmail(String? key) {
    if (key == null || key.isEmpty) {
      return '';
    }
    // Regular expression for basic email format validation
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(key)) {
      return '';
    }
    return null;
  }

  String? validatePassword(
    String? key,
    /*String input*/
  ) {
    if (key == null || key.isEmpty) {
      return '';
    }
    if (key.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
    // if (key != input) {
    //   return 'Password does not match!';
    // }
    // return null;
  }
}
