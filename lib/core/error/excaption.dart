class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  String toString() {
    return " $message";
  }
}
