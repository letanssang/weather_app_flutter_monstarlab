enum LocationPermissionState {
  /// The permission to use location services has been granted.
  granted,

  /// The permission to use location services has been denied by the user. May
  /// have been denied forever on iOS.
  denied,

  /// The permission state is unknown. Only supported on iOS.
  unknown,
  // location service is disabled
  disabled,
}
