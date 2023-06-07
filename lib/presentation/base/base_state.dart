import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/city.dart';
import '../../domain/entities/weather.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default([]) List<Weather> citiesWeather,
    @Default(0) double currentLatitude,
    @Default(0) double currentLongitude,
    @Default([]) List<City> cities,
  }) = _BaseState;
}
