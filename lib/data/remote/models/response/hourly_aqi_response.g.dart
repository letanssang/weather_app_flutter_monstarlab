// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_aqi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyAQIResponse _$HourlyAQIResponseFromJson(Map<String, dynamic> json) =>
    HourlyAQIResponse(
      (json['data'] as List<dynamic>)
          .map((e) => HourlyAQI.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyAQIResponseToJson(HourlyAQIResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
