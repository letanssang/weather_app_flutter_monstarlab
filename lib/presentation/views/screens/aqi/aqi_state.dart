import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/aqi.dart';
import '../../../../domain/entities/hourly_aqi.dart';
import '../../../../domain/enums/fetching_state.dart';

part 'aqi_state.freezed.dart';

@freezed
class AQIState with _$AQIState {
  const factory AQIState({
    @Default(FetchingState.init) FetchingState fetchingState,
    required AQI currentAQI,
    required List<HourlyAQI> hourlyAQIs,
  }) = _AQIState;
}
