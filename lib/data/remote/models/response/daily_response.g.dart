// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyResponse _$DailyResponseFromJson(Map<String, dynamic> json) =>
    DailyResponse(
      (json['data'] as List<dynamic>)
          .map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyResponseToJson(DailyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
