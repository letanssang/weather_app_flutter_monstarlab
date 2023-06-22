enum TemperatureUnit {
  celsius,
  fahrenheit,
  kelvin,
}

extension TemperatureExtension on TemperatureUnit {
  String toTempString() {
    switch (this) {
      case TemperatureUnit.celsius:
        return '\u00b0C';
      case TemperatureUnit.fahrenheit:
        return '\u00b0F';
      case TemperatureUnit.kelvin:
        return '\u00b0K';
      default:
        return '';
    }
  }
}

enum SpeedUnit {
  metersPerSecond,
  kilometersPerHour,
  milesPerHour,
}

extension SpeedExtension on SpeedUnit {
  String toSpeedString() {
    switch (this) {
      case SpeedUnit.metersPerSecond:
        return 'm/s';
      case SpeedUnit.kilometersPerHour:
        return 'km/h';
      case SpeedUnit.milesPerHour:
        return 'mph';
      default:
        return '';
    }
  }
}

enum PressureUnit {
  hectoPascal,
  milliBar,
  millimeterOfMercury,
}

extension PressureExtension on PressureUnit {
  String toPressureString() {
    switch (this) {
      case PressureUnit.hectoPascal:
        return 'hPa';
      case PressureUnit.milliBar:
        return 'mb';
      case PressureUnit.millimeterOfMercury:
        return 'mmHg';
      default:
        return '';
    }
  }
}

enum Language {
  english,
  vietnamese,
}

extension LanguageExtension on Language {
  String toLanguageString() {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.vietnamese:
        return 'Tiếng Việt';
      default:
        return '';
    }
  }
}
