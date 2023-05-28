// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AQIResponse _$AQIResponseFromJson(Map<String, dynamic> json) => AQIResponse(
      (json['data'] as List<dynamic>)
          .map((e) => AQI.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AQIResponseToJson(AQIResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
