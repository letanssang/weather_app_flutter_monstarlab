// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    HourlyForecast(
      (json['temp'] as num).toDouble(),
      DateTime.parse(json['timestamp_local'] as String),
      WeatherDescription.fromJson(json['weather'] as Map<String, dynamic>),
      (json['wind_spd'] as num).toDouble(),
      json['pop'] as int,
    );

Map<String, dynamic> _$HourlyForecastToJson(HourlyForecast instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'timestamp_local': instance.time.toIso8601String(),
      'weather': instance.weather,
      'wind_spd': instance.windSpd,
      'pop': instance.pop,
    };
