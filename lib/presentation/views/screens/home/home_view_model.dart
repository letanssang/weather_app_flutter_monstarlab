import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/home/home_screen.dart';

import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/use_cases/get_current_weather_from_city_list_use_case.dart';
import '../../../../domain/use_cases/get_current_weather_from_coordinate_use_case.dart';
import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final Ref _ref;
  final GetCurrentWeatherFromCoordinateUseCase
      _getCurrentWeatherFromCoordinateUseCase;
  final GetCurrentWeatherFromCityListUseCase
      _getCurrentWeatherFromCityListUseCase;

  HomeViewModel(this._ref, this._getCurrentWeatherFromCoordinateUseCase,
      this._getCurrentWeatherFromCityListUseCase)
      : super(HomeState(pageController: PageController()));

  Future<void> fetchWeathers() async {
    state = state.copyWith(fetchingState: FetchingState.loading);
    try {
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
      final weathers = [...weatherCurrentLocation, ...weatherCities];
      print(weathers.length);
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
