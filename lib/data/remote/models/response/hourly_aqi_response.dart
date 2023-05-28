import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/hourly_aqi.dart';

part 'hourly_aqi_response.g.dart';

@JsonSerializable()
class HourlyAQIResponse {
  List<HourlyAQI> data;
  HourlyAQIResponse(this.data);
  factory HourlyAQIResponse.fromJson(Map<String, dynamic> json) =>
      _$HourlyAQIResponseFromJson(json);
}
