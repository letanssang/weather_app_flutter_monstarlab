import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/daily_forecast.dart';

part 'daily_response.g.dart';

@JsonSerializable()
class DailyResponse {
  List<DailyForecast> data;
  DailyResponse(this.data);
  factory DailyResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyResponseFromJson(json);
}
