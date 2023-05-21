import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/weather.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  int count;
  List<Weather> data;

  WeatherResponse(this.count, this.data);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
