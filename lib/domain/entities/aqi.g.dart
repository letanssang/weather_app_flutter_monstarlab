// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AQI _$AQIFromJson(Map<String, dynamic> json) => AQI(
      aqi: json['aqi'] as int? ?? 0,
      o3: (json['o3'] as num?)?.toDouble() ?? 0,
      so2: (json['so2'] as num?)?.toDouble() ?? 0,
      no2: (json['no2'] as num?)?.toDouble() ?? 0,
      co: (json['co'] as num?)?.toDouble() ?? 0,
      pm10: (json['pm10'] as num?)?.toDouble() ?? 0,
      pm25: (json['pm25'] as num?)?.toDouble() ?? 0,
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
