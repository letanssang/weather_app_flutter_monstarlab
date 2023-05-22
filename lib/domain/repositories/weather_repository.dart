import 'package:weather_app_flutter_monstarlab/data/remote/models/response/daily_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/hourly_response.dart';

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

  Future<DailyResponse> getDailyForecast({
    String? city,
    int? days,
    String? units,
  });

  Future<HourlyResponse> getHourlyForecast({
    String? city,
    int? hours,
    String? units,
  });
}
