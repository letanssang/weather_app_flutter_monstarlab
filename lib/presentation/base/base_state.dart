import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/location_permission_state.dart';

import '../../domain/entities/city.dart';
import '../../domain/entities/weather.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default([]) List<Weather> citiesWeather,
    @Default(21.0245) double currentLatitude,
    @Default(105.84117) double currentLongitude,
    @Default([]) List<City> cities,
    @Default(LocationPermissionState.unknown)
    LocationPermissionState locationPermissionState,
  }) = _BaseState;
}
