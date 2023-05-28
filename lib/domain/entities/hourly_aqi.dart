import 'package:json_annotation/json_annotation.dart';

part 'hourly_aqi.g.dart';

@JsonSerializable()
class HourlyAQI {
  @JsonKey(name: 'timestamp_local')
  final DateTime? timestamp;
  final int aqi;
  HourlyAQI(
    this.aqi,
    this.timestamp,
  );
  factory HourlyAQI.fromJson(Map<String, dynamic> json) =>
      _$HourlyAQIFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyAQIToJson(this);
}
