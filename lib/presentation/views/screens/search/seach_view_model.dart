import 'dart:async';

import 'package:flutter/cupertino.dart';
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
  ) : super(SearchState(
            textEditingController: TextEditingController(),
            focusNode: FocusNode()));
  Future<void> getSuggestCities() async {
    final query = state.textEditingController.value.text;
    if (query == '') {
      state = state.copyWith(
        suggestions: [],
        fetchingState: FetchingState.init,
      );
      return;
    }
    try {
      final cities = await _databaseHelper.getCitiesFromSearch(query);
      state.focusNode.unfocus();
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
      throw Exception('Failed to get suggest list from database');
    }
  }

  void onChangedHandler() {
    state = state.copyWith(fetchingState: FetchingState.loading);
    const duration = Duration(milliseconds: 1000);
    if (state.searchOnStoppedTyping != null) {
      state.searchOnStoppedTyping!.cancel();
    }
    state = state.copyWith(
        searchOnStoppedTyping: Timer(duration, () => getSuggestCities()));
  }

  void focusOnStart() {
    state.focusNode.requestFocus();
  }

  void addCityToList(City city) {
    final addCitySuccesssful =
        ref.read(baseViewModelProvider.notifier).addCityToList(city);
  }
}
