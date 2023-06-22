import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/aqi.dart';
import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/use_cases/get_aqi_data_use_case.dart';
import '../../../../domain/use_cases/get_hour_aqi_use_case.dart';
import 'aqi_state.dart';

class AQIViewModel extends StateNotifier<AQIState> {
  final GetAQIDataUseCase getAQIDataUseCase;
  final GetHourlyAQIUseCase getHourlyAQIUseCase;

  AQIViewModel(this.getAQIDataUseCase, this.getHourlyAQIUseCase)
      : super(AQIState(currentAQI: AQI(), hourlyAQIs: []));

  Future<void> fetchDataAQI(String cityName) async {
    if (!mounted) return;
    state = state.copyWith(fetchingState: FetchingState.loading);
    try {
      final currentAQI = await getAQIDataUseCase.run(city: cityName);
      final hourlyAQIs =
          await getHourlyAQIUseCase.run(city: cityName, hours: 24);
      state = state.copyWith(
          fetchingState: FetchingState.success,
          currentAQI: currentAQI.first,
          hourlyAQIs: hourlyAQIs);
    } catch (e) {
      if (!mounted) {
        state = state.copyWith(fetchingState: FetchingState.failure);
      }
    }
  }
}
