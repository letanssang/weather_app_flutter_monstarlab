import 'package:weather_app_flutter_monstarlab/data/remote/models/response/daily_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/hourly_aqi_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/hourly_response.dart';

import '../../domain/repositories/weather_repository.dart';
import '../remote/models/response/aqi_response.dart';
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
  }) {
    return _weatherApiClient.getCurrentWeatherFromCoordinate(
      lat,
      lon,
    );
  }

  @override
  Future<WeatherResponse> getCurrentWeatherFromCityList(
      {String? city, String? cities}) {
    return _weatherApiClient.getCurrentWeatherFromCityList(
      city,
      cities,
    );
  }

  @override
  Future<DailyResponse> getDailyForecast({String? city, int? days}) {
    return _weatherApiClient.getDailyForecast(
      city,
      days,
    );
  }

  @override
  Future<HourlyResponse> getHourlyForecast({String? city, int? hours}) {
    return _weatherApiClient.getHourlyForecast(
      city,
      hours,
    );
  }

  @override
  Future<AQIResponse> getCurrentAQI({String? city, double? lat, double? lon}) {
    return _weatherApiClient.getCurrentAQI(
      lat,
      lon,
      city,
    );
  }

  @override
  Future<HourlyAQIResponse> getHourlyAQI(
      {double? lat, double? lon, String? city, int? hours}) {
    return _weatherApiClient.getHourlyAQI(
      lat,
      lon,
      city,
      hours,
    );
  }
}
