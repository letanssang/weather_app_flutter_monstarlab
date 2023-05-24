import '../../../domain/entities/weather.dart';

abstract class SharedPreferencesHelper {
  Future<void> saveWeatherData(List<Weather> weathers);
  Future<List<Weather>> getWeatherData();
  Future<bool> isWeatherDataAvailable();
}
