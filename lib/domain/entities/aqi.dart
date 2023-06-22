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
  AQI({
    this.aqi = 0,
    this.o3 = 0,
    this.so2 = 0,
    this.no2 = 0,
    this.co = 0,
    this.pm10 = 0,
    this.pm25 = 0,
  });
  factory AQI.fromJson(Map<String, dynamic> json) => _$AQIFromJson(json);
  Map<String, dynamic> toJson() => _$AQIToJson(this);
}
