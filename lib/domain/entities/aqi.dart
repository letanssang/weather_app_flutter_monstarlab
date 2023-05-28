import 'package:json_annotation/json_annotation.dart';

part 'aqi.g.dart';

@JsonSerializable()
class AQI {
  final int aqi;
  final double o3;
  final double so2;
  final double no2;
  final double co;
  final double pm10;
  final double pm25;
  AQI(
    this.aqi,
    this.o3,
    this.so2,
    this.no2,
    this.co,
    this.pm10,
    this.pm25,
  );
  factory AQI.fromJson(Map<String, dynamic> json) => _$AQIFromJson(json);
  Map<String, dynamic> toJson() => _$AQIToJson(this);
}
