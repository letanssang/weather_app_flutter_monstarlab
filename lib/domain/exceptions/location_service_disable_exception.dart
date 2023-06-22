class LocationServiceDisableException implements Exception {
  final String message = 'Location services are disabled.';

  LocationServiceDisableException();

  @override
  String toString() {
    return message;
  }
}
