class AppValidators {
  static String? emptyCheck(String? v, String? message) {
    if (v == null || v == '') {
      return message;
    } else {
      return null;
    }
  }
}
