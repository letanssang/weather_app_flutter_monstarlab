import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../data/local/shared_preferences_helper/shared_preferences_helper.dart';
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
      await fetchLocationWeather();
      final bool isCitiesAvailable = await _sharedPreferencesHelper
          .isCitiesWeatherAvailable(_ref.read(baseViewModelProvider).cities);
      if (isCitiesAvailable) {
        final citiesWeather = await _sharedPreferencesHelper.getWeatherCities();
        state = state.copyWith(citiesWeather: citiesWeather);
      } else {
        _sharedPreferencesHelper.clearCitiesWeather();
        fetchCitiesWeather();
      }
      state = state.copyWith(fetchingState: FetchingState.success);
      state.pageController.addListener(() {
        _ref
            .read(homeViewModelProvider.notifier)
            .onPageChanged(state.pageController.page!);
      });
    } catch (e) {
      if (!mounted) {
        state = state.copyWith(fetchingState: FetchingState.failure);
      }
      debugPrint(e.toString());
    }
  }

  Future<void> fetchLocationWeather() async {
    final lat = _ref.watch(baseViewModelProvider).currentLatitude;
    final lon = _ref.watch(baseViewModelProvider).currentLongitude;
    final weatherLocation = await _getCurrentWeatherFromCoordinateUseCase.run(
      lat: lat,
      lon: lon,
      units: 'metric',
    );
    state = state.copyWith(locationWeather: weatherLocation);
  }

  Future<void> fetchCitiesWeather() async {
    final citiesIdString =
        _ref.read(baseViewModelProvider.notifier).getCitiesIdsString();
    if (citiesIdString.isEmpty) return;
    final weatherCities = await _getCurrentWeatherFromCityListUseCase.run(
      cities: _ref.read(baseViewModelProvider.notifier).getCitiesIdsString(),
      units: 'metric',
    );
    state = state.copyWith(citiesWeather: weatherCities);
    await _sharedPreferencesHelper.saveWeatherCities(state.citiesWeather);
  }

  void onPageChanged(double index) {
    state = state.copyWith(currentPage: index);
  }
}
