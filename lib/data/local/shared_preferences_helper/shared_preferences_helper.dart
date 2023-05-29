import '../../../domain/entities/city.dart';
import '../../../domain/entities/weather.dart';

abstract class SharedPreferencesHelper {
  Future<void> clearCitiesWeather();
  Future<void> saveWeatherCities(List<Weather> weatherCities);
  Future<List<Weather>> getWeatherCities();
  Future<bool> isCitiesWeatherAvailable(List<City> cities);
  Future<void> saveCities(List<City> cities);
  Future<List<City>> getCities();
  Future<void> saveTemperatureUnit(String unit);
  Future<String?> getTemperatureUnit();
  Future<void> saveSpeedUnit(String unit);
  Future<String?> getSpeedUnit();
  Future<void> savePressureUnit(String unit);
  Future<String?> getPressureUnit();
}
