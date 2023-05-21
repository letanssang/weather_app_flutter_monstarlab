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
    String? lang,
    String? units,
  }) {
    return _weatherApiClient.getCurrentWeatherFromCoordinate(
      lat,
      lon,
      apiKey,
      lang,
      units,
    );
  }

  @override
  Future<WeatherResponse> getCurrentWeatherFromCityName(
      {String? city, String? cities, String? lang, String? units}) {
    return _weatherApiClient.getCurrentWeatherFromCityName(
      city,
      cities,
      apiKey,
      lang,
      units,
    );
  }
}
