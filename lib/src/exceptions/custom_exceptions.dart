class DriftException implements Exception {
  const DriftException({required this.message});
  final String message;

  @override
  String toString() {
    return message;
  }
}

class GeneralException implements Exception {
  const GeneralException();
}
