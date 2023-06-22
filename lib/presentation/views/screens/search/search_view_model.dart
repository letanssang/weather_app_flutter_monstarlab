import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_state.dart';

import '../../../../data/local/database_helper/database_helper.dart';
import '../../../../domain/entities/city.dart';
import '../home/home_screen.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  final Ref ref;
  final DatabaseHelper _databaseHelper;
  SearchViewModel(
    this.ref,
    this._databaseHelper,
  ) : super(const SearchState());
  Future<void> getSuggestCities(String query) async {
    if (query == '') {
      state = state.copyWith(
        suggestions: [],
        fetchingState: FetchingState.init,
      );
      return;
    }
    try {
      final cities = await _databaseHelper.getCitiesFromSearch(query);
      if (cities.isNotEmpty) {
        state = state.copyWith(
          suggestions: cities,
          fetchingState: FetchingState.success,
        );
      } else {
        state = state.copyWith(fetchingState: FetchingState.failure);
      }
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(fetchingState: FetchingState.failure);
    }
  }

  void onChangedHandler() {
    state = state.copyWith(fetchingState: FetchingState.loading);
  }

  void addCityToList(City city) {
    ref.read(baseViewModelProvider.notifier).addCityToList(city);
  }
}
