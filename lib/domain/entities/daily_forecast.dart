import 'package:json_annotation/json_annotation.dart';

import 'weather_description.dart';

part 'daily_forecast.g.dart';

@JsonSerializable()
class DailyForecast {
  @JsonKey(name: 'valid_date')
  DateTime date;
  @JsonKey(name: 'min_temp')
  double minTemperature;
  @JsonKey(name: 'max_temp')
  double maxTemperature;
  @JsonKey(name: 'weather')
  WeatherDescription weather;
  @JsonKey(name: 'wind_spd')
  double windSpd;

  DailyForecast(
    this.date,
    this.minTemperature,
    this.maxTemperature,
    this.weather,
    this.windSpd,
  );
  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
  Map<String, dynamic> toJson() => _$DailyForecastToJson(this);
}
