import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/hourly_forecast.dart';

part 'hourly_response.g.dart';

@JsonSerializable()
class HourlyResponse {
  List<HourlyForecast> data;
  HourlyResponse(this.data);
  factory HourlyResponse.fromJson(Map<String, dynamic> json) =>
      _$HourlyResponseFromJson(json);
}
