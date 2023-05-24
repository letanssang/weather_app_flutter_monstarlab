import 'package:json_annotation/json_annotation.dart';

import 'daily_forecast.dart';
import 'hourly_forecast.dart';
import 'weather_description.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'app_temp')
  double feelLike;
  int aqi;
  @JsonKey(name: 'city_name')
  String cityName;
  int clouds;
  double? gust;
  @JsonKey(name: 'ob_time')
  DateTime obTime;
  @JsonKey(name: 'pod')
  String partOfDay;
  @JsonKey(name: 'pres')
  double pressure;
  @JsonKey(name: 'rh')
  int humidity;
  String sunrise;
  String sunset;
  @JsonKey(name: 'temp')
  double temperature;
  String timezone;
  double uv;
  @JsonKey(name: 'vis')
  int visibility;
  WeatherDescription weather;
  @JsonKey(name: 'wind_cdir_full')
  String windDirection;
  @JsonKey(name: 'wind_spd')
  double windSpd;
  List<HourlyForecast> hourlyForecasts;
  List<DailyForecast> dailyForecasts;

  Weather(
      this.feelLike,
      this.pressure,
      this.humidity,
      this.temperature,
      this.visibility,
      this.partOfDay,
      this.aqi,
      this.cityName,
      this.clouds,
      this.gust,
      this.obTime,
      this.sunrise,
      this.sunset,
      this.timezone,
      this.uv,
      this.weather,
      this.windDirection,
      this.windSpd,
      {this.hourlyForecasts = const [],
      this.dailyForecasts = const []});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
