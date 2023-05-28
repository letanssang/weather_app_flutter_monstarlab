import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/aqi.dart';

part 'aqi_response.g.dart';

@JsonSerializable()
class AQIResponse {
  List<AQI> data;
  AQIResponse(this.data);
  factory AQIResponse.fromJson(Map<String, dynamic> json) =>
      _$AQIResponseFromJson(json);
}
