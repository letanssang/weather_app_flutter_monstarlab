import 'package:weather_app_flutter_monstarlab/data/remote/models/response/aqi_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/daily_response.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/models/response/hourly_response.dart';

import '../../data/remote/models/response/hourly_aqi_response.dart';
import '../../data/remote/models/response/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> getCurrentWeatherFromCoordinate({
    double? lat,
    double? lon,
  });

  Future<WeatherResponse> getCurrentWeatherFromCityList({
    String? city,
    String? cities,
  });

  Future<DailyResponse> getDailyForecast({
    String? city,
    int? days,
  });

  Future<HourlyResponse> getHourlyForecast({
    String? city,
    int? hours,
  });
  Future<AQIResponse> getCurrentAQI({
    double? lat,
    double? lon,
    String? city,
  });
  Future<HourlyAQIResponse> getHourlyAQI({
    double? lat,
    double? lon,
    String? city,
    int? hours,
  });
}
