// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) =>
    WeatherDescription(
      json['description'] as String,
      json['code'] as int,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
      'code': instance.code,
      'icon': instance.icon,
    };
