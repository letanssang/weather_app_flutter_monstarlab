import '../../data/remote/models/response/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> getCurrentWeatherFromCoordinate({
    double? lat,
    double? lon,
    String? lang,
    String? units,
  });
  Future<WeatherResponse> getCurrentWeatherFromCityName({
    String? city,
    String? cities,
    String? lang,
    String? units,
  });
}
