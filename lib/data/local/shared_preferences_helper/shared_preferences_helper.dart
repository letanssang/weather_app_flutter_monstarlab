import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';

import '../../../domain/entities/city.dart';
import '../../../domain/entities/weather.dart';

abstract class SharedPreferencesHelper {
  Future<void> clearCitiesWeather();
  Future<void> saveWeatherCities(List<Weather> weatherCities);
  Future<List<Weather>> getWeatherCities();
  Future<bool> isCitiesWeatherAvailable(List<City> cities);
  Future<void> saveCities(List<City> cities);
  Future<List<City>> getCities();
  Future<void> saveTemperatureUnit(TemperatureUnit temperatureUnit);
  Future<TemperatureUnit?> getTemperatureUnit();
  Future<void> saveSpeedUnit(SpeedUnit speedUnit);
  Future<SpeedUnit?> getSpeedUnit();
  Future<void> savePressureUnit(PressureUnit pressureUnit);
  Future<PressureUnit?> getPressureUnit();
  Future<void> saveLanguage(Language language);
  Future<Language?> getLanguage();
}
