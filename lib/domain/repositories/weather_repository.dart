import '../../data/remote/models/response/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> getCurrentWeatherFromCoordinate({
    double? lat,
    double? lon,
    String? units,
  });
  Future<WeatherResponse> getCurrentWeatherFromCityList({
    String? city,
    String? cities,
    String? units,
  });
}
