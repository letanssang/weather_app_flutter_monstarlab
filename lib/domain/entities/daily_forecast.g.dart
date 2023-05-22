// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    DailyForecast(
      DateTime.parse(json['valid_date'] as String),
      (json['min_temp'] as num).toDouble(),
      (json['max_temp'] as num).toDouble(),
      WeatherDescription.fromJson(json['weather'] as Map<String, dynamic>),
      (json['wind_spd'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyForecastToJson(DailyForecast instance) =>
    <String, dynamic>{
      'valid_date': instance.date.toIso8601String(),
      'min_temp': instance.minTemperature,
      'max_temp': instance.maxTemperature,
      'weather': instance.weather,
      'wind_spd': instance.windSpd,
    };
