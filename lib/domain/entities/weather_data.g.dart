// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      (json['app_temp'] as num).toDouble(),
      (json['pres'] as num).toDouble(),
      json['rh'] as int,
      (json['temp'] as num).toDouble(),
      json['vis'] as int,
      json['pod'] as String,
      json['aqi'] as int,
      json['city_name'] as String,
      json['clouds'] as int,
      (json['gust'] as num).toDouble(),
      json['lat'] as int,
      json['lon'] as int,
      json['ob_time'] as String,
      json['sunrise'] as String,
      json['sunset'] as String,
      json['timezone'] as String,
      json['uv'] as int,
      WeatherDescription.fromJson(json['weather'] as Map<String, dynamic>),
      json['wind_cdir_full'] as String,
      (json['wind_spd'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'app_temp': instance.feelLike,
      'aqi': instance.aqi,
      'city_name': instance.cityName,
      'clouds': instance.clouds,
      'gust': instance.gust,
      'lat': instance.lat,
      'lon': instance.lon,
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
