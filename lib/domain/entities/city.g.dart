// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      json['city_id'] as int,
      json['city_name'] as String,
      json['country_full'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'city_id': instance.id,
      'city_name': instance.name,
      'country_full': instance.country,
    };
