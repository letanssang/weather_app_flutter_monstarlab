import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../data/local/shared_preferences_helper/shared_preferences_helper.dart';
import '../../../../domain/entities/weather.dart';
import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/use_cases/get_current_weather_from_city_list_use_case.dart';
import '../../../../domain/use_cases/get_current_weather_from_coordinate_use_case.dart';
import 'home_screen.dart';
import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final Ref _ref;
  final GetCurrentWeatherFromCoordinateUseCase
      _getCurrentWeatherFromCoordinateUseCase;
  final GetCurrentWeatherFromCityListUseCase
      _getCurrentWeatherFromCityListUseCase;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  HomeViewModel(this._ref, this._getCurrentWeatherFromCoordinateUseCase,
      this._getCurrentWeatherFromCityListUseCase, this._sharedPreferencesHelper)
      : super(HomeState(pageController: PageController()));

  Future<void> fetchWeathers() async {
    state = state.copyWith(fetchingState: FetchingState.loading);
    try {
      List<Weather> weathers;
      if (await _sharedPreferencesHelper.isWeatherDataAvailable()) {
        weathers = await _sharedPreferencesHelper.getWeatherData();
      } else {
        final weatherCurrentLocation =
            await _getCurrentWeatherFromCoordinateUseCase.run(
          lat: _ref.read(baseViewModelProvider).currentLatitude,
          lon: _ref.read(baseViewModelProvider).currentLongitude,
          units: 'metric',
        );
        final weatherCities = await _getCurrentWeatherFromCityListUseCase.run(
          cities: '4487042, 4494942, 4504871',
          units: 'metric',
        );
        weathers = [...weatherCurrentLocation, ...weatherCities];
        await _sharedPreferencesHelper.saveWeatherData(weathers);
      }
      state = state.copyWith(
        weathers: weathers,
        fetchingState: FetchingState.success,
      );
    } catch (e) {
      state = state.copyWith(fetchingState: FetchingState.failure);
      debugPrint(e.toString());
    }
  }

  void onPageChanged(double index) {
    state = state.copyWith(currentPage: index);
  }
}
