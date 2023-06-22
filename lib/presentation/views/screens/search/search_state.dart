import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';

import '../../../../domain/entities/city.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(FetchingState.init) FetchingState fetchingState,
    @Default([]) List<City> suggestions,
  }) = _SearchState;
}
