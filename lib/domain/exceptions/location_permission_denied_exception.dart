class LocationPermissionDeniedException implements Exception {
  final String message = 'Location permission denied.';

  LocationPermissionDeniedException();

  @override
  String toString() {
    return message;
  }
}
