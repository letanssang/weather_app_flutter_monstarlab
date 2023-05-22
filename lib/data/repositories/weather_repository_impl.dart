import 'package:weather_app_flutter_monstarlab/data/remote/models/response/daily_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/hourly_response.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/string.dart';

import '../../domain/repositories/weather_repository.dart';
import '../remote/models/response/weather_response.dart';
import '../remote/weather_api_client.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiClient _weatherApiClient;

  WeatherRepositoryImpl(this._weatherApiClient);

  @override
  Future<WeatherResponse> getCurrentWeatherFromCoordinate({
    String? city,
    double? lat,
    double? lon,
    String? units,
  }) {
    return _weatherApiClient.getCurrentWeatherFromCoordinate(
      lat,
      lon,
      apiKey,
      units,
    );
  }

  @override
  Future<WeatherResponse> getCurrentWeatherFromCityList(
      {String? city, String? cities, String? units}) {
    return _weatherApiClient.getCurrentWeatherFromCityList(
      city,
      cities,
      apiKey,
      units,
    );
  }

  @override
  Future<DailyResponse> getDailyForecast(
      {String? city, int? days, String? units}) {
    return _weatherApiClient.getDailyForecast(
      city,
      days,
      apiKey,
      units,
    );
  }

  @override
  Future<HourlyResponse> getHourlyForecast(
      {String? city, int? hours, String? units}) {
    return _weatherApiClient.getHourlyForecast(
      city,
      hours,
      apiKey,
      units,
    );
  }
}
