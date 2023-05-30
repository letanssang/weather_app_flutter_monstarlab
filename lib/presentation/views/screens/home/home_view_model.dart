import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/use_cases/get_weather_from_coordinate_use_case.dart';
import 'home_screen.dart';
import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final Ref _ref;
  final GetWeatherFromCoordinateUseCase _getCurrentWeatherFromCoordinateUseCase;

  HomeViewModel(this._ref, this._getCurrentWeatherFromCoordinateUseCase)
      : super(HomeState(pageController: PageController())) {
    fetchWeathers();
  }

  Future<void> fetchWeathers() async {
    if (!mounted) return;
    state = state.copyWith(fetchingState: FetchingState.loading);
    try {
      await fetchLocationWeather();
      state = state.copyWith(fetchingState: FetchingState.success);
      state.pageController.addListener(() {
        onPageChanged(state.pageController.page!);
      });
    } catch (e) {
      if (mounted) {
        state = state.copyWith(fetchingState: FetchingState.failure);
      }
    }
  }

  Future<void> fetchLocationWeather() async {
    final lat = _ref.watch(baseViewModelProvider).currentLatitude;
    final lon = _ref.watch(baseViewModelProvider).currentLongitude;
    final weatherLocation = await _getCurrentWeatherFromCoordinateUseCase.run(
      lat: lat,
      lon: lon,
    );
    state = state.copyWith(locationWeather: weatherLocation);
  }

  void onPageChanged(double index) {
    state = state.copyWith(currentPage: index);
  }
}
