// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_aqi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyAQI _$HourlyAQIFromJson(Map<String, dynamic> json) => HourlyAQI(
      json['aqi'] as int,
      json['timestamp_local'] == null
          ? null
          : DateTime.parse(json['timestamp_local'] as String),
    );

Map<String, dynamic> _$HourlyAQIToJson(HourlyAQI instance) => <String, dynamic>{
      'timestamp_local': instance.timestamp?.toIso8601String(),
      'aqi': instance.aqi,
    };
