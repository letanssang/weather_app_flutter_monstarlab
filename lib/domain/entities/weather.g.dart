// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      (json['app_temp'] as num).toDouble(),
      (json['pres'] as num).toDouble(),
      json['rh'] as int,
      (json['temp'] as num).toDouble(),
      json['vis'] as int,
      json['pod'] as String,
      json['aqi'] as int,
      json['city_name'] as String,
      json['clouds'] as int,
      (json['gust'] as num?)?.toDouble(),
      json['ob_time'] as String,
      json['sunrise'] as String,
      json['sunset'] as String,
      json['timezone'] as String,
      (json['uv'] as num).toDouble(),
      WeatherDescription.fromJson(json['weather'] as Map<String, dynamic>),
      json['wind_cdir_full'] as String,
      (json['wind_spd'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'app_temp': instance.feelLike,
      'aqi': instance.aqi,
      'city_name': instance.cityName,
      'clouds': instance.clouds,
      'gust': instance.gust,
      'ob_time': instance.obTime,
      'pod': instance.partOfDay,
      'pres': instance.pressure,
      'rh': instance.humidity,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temperature,
      'timezone': instance.timezone,
      'uv': instance.uv,
      'vis': instance.visibility,
      'weather': instance.weather,
      'wind_cdir_full': instance.windDirection,
      'wind_spd': instance.windSpd,
    };
