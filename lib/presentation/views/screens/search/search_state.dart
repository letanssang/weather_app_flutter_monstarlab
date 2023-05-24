import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';

import '../../../../domain/entities/city.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    Timer? searchOnStoppedTyping,
    @Default(FetchingState.init) FetchingState fetchingState,
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    @Default([]) List<City> suggestions,
  }) = _SearchState;
}
