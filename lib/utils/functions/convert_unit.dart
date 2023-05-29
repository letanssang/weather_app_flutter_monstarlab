import 'dart:core';

import '../../domain/enums/units.dart';

double getTemp(double temperature, TemperatureUnit temperatureUnit) {
  if (temperatureUnit == TemperatureUnit.celsius) {
    return temperature;
  } else if (temperatureUnit == TemperatureUnit.fahrenheit) {
    return convertCelciusToFahrenheit(temperature);
  } else {
    return convertCelciusToKelvin(temperature);
  }
}

double getSpeed(double speed, SpeedUnit speedUnit) {
  if (speedUnit == SpeedUnit.metersPerSecond) {
    return speed;
  } else if (speedUnit == SpeedUnit.kilometersPerHour) {
    return convertMetersPerSecondToKilometersPerHour(speed);
  } else {
    return convertMetersPerSecondToMilesPerHour(speed);
  }
}

double getPressure(double pressure, PressureUnit pressureUnit) {
  if (pressureUnit == PressureUnit.milliBar) {
    return pressure;
  } else if (pressureUnit == PressureUnit.millimeterOfMercury) {
    return convertMillibarToMillimeterOfMercury(pressure);
  } else {
    return convertMillibarToHectoPascal(pressure);
  }
}

double convertCelciusToFahrenheit(double temperature) {
  return (temperature * 9 / 5) + 32;
}

double convertCelciusToKelvin(double temperature) {
  return temperature + 273.15;
}

double convertMetersPerSecondToKilometersPerHour(double speed) {
  return speed * 3.6;
}

double convertMetersPerSecondToMilesPerHour(double speed) {
  return speed * 2.237;
}

double convertMillibarToHectoPascal(double pressure) {
  return pressure * 0.1;
}

double convertMillibarToMillimeterOfMercury(double pressure) {
  return pressure * 0.750062;
}
