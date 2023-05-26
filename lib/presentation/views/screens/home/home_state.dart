import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';

import '../../../../domain/entities/weather.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Weather> locationWeather,
    @Default(FetchingState.init) FetchingState fetchingState,
    required PageController pageController,
    @Default(0) double currentPage,
  }) = _HomeState;
}
