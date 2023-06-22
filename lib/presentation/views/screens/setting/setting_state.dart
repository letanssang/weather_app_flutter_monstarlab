import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/enums/units.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(TemperatureUnit.celsius) TemperatureUnit temperatureUnit,
    @Default(PressureUnit.milliBar) PressureUnit pressureUnit,
    @Default(SpeedUnit.metersPerSecond) SpeedUnit speedUnit,
    @Default(Locale('en', 'US')) Locale locale,
    @Default(Language.english) Language language,
  }) = _SettingState;
}
