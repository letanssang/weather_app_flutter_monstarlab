// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyResponse _$HourlyResponseFromJson(Map<String, dynamic> json) =>
    HourlyResponse(
      (json['data'] as List<dynamic>)
          .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyResponseToJson(HourlyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
