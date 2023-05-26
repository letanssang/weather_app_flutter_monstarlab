import '../../../domain/entities/city.dart';
import '../../../domain/entities/weather.dart';

abstract class SharedPreferencesHelper {
  Future<void> clearCitiesWeather();
  Future<void> saveWeatherCities(List<Weather> weatherCities);
  Future<List<Weather>> getWeatherCities();
  Future<bool> isCitiesWeatherAvailable(List<City> cities);
  Future<void> saveCities(List<City> cities);
  Future<List<City>> getCities();
}
