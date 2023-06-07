import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_state.dart';

import '../../../../data/local/shared_preferences_helper/shared_preferences_helper.dart';
import '../../../../domain/enums/units.dart';

class SettingViewModel extends StateNotifier<SettingState> {
  final Ref ref;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  SettingViewModel(this.ref, this._sharedPreferencesHelper)
      : super(const SettingState());

  Future<void> init() async {
    final temperatureUnit = await _sharedPreferencesHelper.getTemperatureUnit();
    final pressureUnit = await _sharedPreferencesHelper.getPressureUnit();
    final speedUnit = await _sharedPreferencesHelper.getSpeedUnit();
    final language = await _sharedPreferencesHelper.getLanguage();
    if (temperatureUnit != null) {
      onTemperatureUnitChanged(temperatureUnit);
    }
    if (pressureUnit != null) {
      onPressureUnitChanged(pressureUnit);
    }
    if (speedUnit != null) {
      onSpeedUnitChanged(speedUnit);
    }
    if (language != null) {
      onLanguageChanged(language);
    }
  }

  void onTemperatureUnitChanged(String unit) {
    switch (unit) {
      case '\u00b0C':
        state = state.copyWith(temperatureUnit: TemperatureUnit.celsius);
        break;
      case '\u00b0F':
        state = state.copyWith(temperatureUnit: TemperatureUnit.fahrenheit);
        break;
      case "\u00b0K":
        state = state.copyWith(temperatureUnit: TemperatureUnit.kelvin);
        break;
    }

    _sharedPreferencesHelper.saveTemperatureUnit(unit);
    state = state.copyWith(temperatureUnitString: unit);
  }

  void onSpeedUnitChanged(String unit) {
    switch (unit) {
      case 'm/s':
        state = state.copyWith(speedUnit: SpeedUnit.metersPerSecond);
        break;
      case 'km/h':
        state = state.copyWith(speedUnit: SpeedUnit.kilometersPerHour);
        break;
      case "mph":
        state = state.copyWith(speedUnit: SpeedUnit.milesPerHour);
        break;
    }
    _sharedPreferencesHelper.saveSpeedUnit(unit);
    state = state.copyWith(speedUnitString: unit);
  }

  void onPressureUnitChanged(String unit) {
    switch (unit) {
      case 'hPa':
        state = state.copyWith(pressureUnit: PressureUnit.hectoPascal);
        break;
      case 'mb':
        state = state.copyWith(pressureUnit: PressureUnit.milliBar);
        break;
      case "mmHg":
        state = state.copyWith(pressureUnit: PressureUnit.millimeterOfMercury);
        break;
    }
    _sharedPreferencesHelper.savePressureUnit(unit);
    state = state.copyWith(pressureUnitString: unit);
  }

  void onLanguageChanged(String language) {
    switch (language) {
      case 'English':
        state = state.copyWith(
            locale: const Locale('en', 'US'), language: 'English');
        break;
      case 'Tiếng Việt':
        state = state.copyWith(
            locale: const Locale('vi', 'VN'), language: 'Tiếng Việt');
        break;
    }
    _sharedPreferencesHelper.saveLanguage(language);
  }
}
