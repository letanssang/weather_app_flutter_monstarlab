// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AQI _$AQIFromJson(Map<String, dynamic> json) => AQI(
      json['aqi'] as int,
      (json['o3'] as num).toDouble(),
      (json['so2'] as num).toDouble(),
      (json['no2'] as num).toDouble(),
      (json['co'] as num).toDouble(),
      (json['pm10'] as num).toDouble(),
      (json['pm25'] as num).toDouble(),
    );

Map<String, dynamic> _$AQIToJson(AQI instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'o3': instance.o3,
      'so2': instance.so2,
      'no2': instance.no2,
      'co': instance.co,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
    };
