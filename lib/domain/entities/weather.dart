import 'package:json_annotation/json_annotation.dart';

import 'weather_data.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  int count;
  List<WeatherData> data;

  Weather(this.count, this.data);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
