import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

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
    @Query('lang') String? lang,
    @Query('units') String? units,
  );
  @GET('current')
  Future<WeatherResponse> getCurrentWeatherFromCityName(
    @Query('city') String? city,
    @Query('cities') String? cities,
    @Query('key') String? key,
    @Query('lang') String? lang,
    @Query('units') String? units,
  );
}
