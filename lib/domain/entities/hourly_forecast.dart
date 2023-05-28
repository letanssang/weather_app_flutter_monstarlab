import 'package:json_annotation/json_annotation.dart';

import 'weather_description.dart';

part 'hourly_forecast.g.dart';

@JsonSerializable()
class HourlyForecast {
  @JsonKey(name: 'temp')
  double temperature;
  @JsonKey(name: 'timestamp_local')
  DateTime time;
  WeatherDescription weather;
  @JsonKey(name: 'wind_spd')
  double windSpd;
  int pop;

  HourlyForecast(
      this.temperature, this.time, this.weather, this.windSpd, this.pop);
  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyForecastToJson(this);
}
