class Failure implements Exception {
  final String message;
  final StackTrace stackTrace;

  Failure({
    required this.message,
    required this.stackTrace,
  });

  @override
  String toString() => message;
}
