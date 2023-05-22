import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/daily_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/hourly_response.dart';

import 'models/response/weather_response.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: 'http://api.weatherbit.io/v2.0/')
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET('current')
  Future<WeatherResponse> getCurrentWeatherFromCoordinate(
    @Query('lat') double? lat,
    @Query('lon') double? lon,
    @Query('key') String? key,
    @Query('units') String? units,
  );

  @GET('current')
  Future<WeatherResponse> getCurrentWeatherFromCityList(
    @Query('city') String? city,
    @Query('cities') String? cities,
    @Query('key') String? key,
    @Query('units') String? units,
  );

  @GET('forecast/daily')
  Future<DailyResponse> getDailyForecast(
    @Query('city') String? city,
    @Query('days') int? days,
    @Query('key') String? key,
    @Query('units') String? units,
  );

  @GET('forecast/hourly')
  Future<HourlyResponse> getHourlyForecast(
    @Query('city') String? city,
    @Query('hours') int? hours,
    @Query('key') String? key,
    @Query('units') String? units,
  );
}
