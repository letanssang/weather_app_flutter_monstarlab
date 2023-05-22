import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/weather_units.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default(WeatherUnits.metric) WeatherUnits units,
    @Default(0) double currentLatitude,
    @Default(0) double currentLongitude,
  }) = _BaseState;
}
