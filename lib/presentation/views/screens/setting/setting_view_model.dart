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

  void onTemperatureUnitChanged(TemperatureUnit temperatureUnit) {
    _sharedPreferencesHelper.saveTemperatureUnit(temperatureUnit);
    state = state.copyWith(temperatureUnit: temperatureUnit);
  }

  void onSpeedUnitChanged(SpeedUnit speedUnit) {
    _sharedPreferencesHelper.saveSpeedUnit(speedUnit);
    state = state.copyWith(speedUnit: speedUnit);
  }

  void onPressureUnitChanged(PressureUnit pressureUnit) {
    _sharedPreferencesHelper.savePressureUnit(pressureUnit);
    state = state.copyWith(pressureUnit: pressureUnit);
  }

  void onLanguageChanged(Language language) {
    switch (language) {
      case Language.english:
        state = state.copyWith(
            locale: const Locale('en', 'US'), language: language);
        break;
      case Language.vietnamese:
        state = state.copyWith(
            locale: const Locale('vi', 'VN'), language: language);
        break;
    }
    _sharedPreferencesHelper.saveLanguage(language);
  }
}
