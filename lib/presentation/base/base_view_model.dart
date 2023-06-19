import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/city.dart';
import 'package:weather_app_flutter_monstarlab/domain/use_cases/get_weather_from_city_list_use_case.dart';
import 'package:weather_app_flutter_monstarlab/presentation/base/base_state.dart';

import '../../data/local/shared_preferences_helper/shared_preferences_helper.dart';
import '../../domain/entities/weather.dart';

class BaseViewModel extends StateNotifier<BaseState> {
  final SharedPreferencesHelper _sharedPreferencesHelper;
  final GetWeatherFromCityListUseCase _getCurrentWeatherFromCityListUseCase;

  BaseViewModel(
    this._sharedPreferencesHelper,
    this._getCurrentWeatherFromCityListUseCase,
  ) : super(const BaseState());

  Future<void> init() async {
    await determinePosition();
    final cities = await _sharedPreferencesHelper.getCities();
    state = state.copyWith(cities: cities);
    final bool isCitiesAvailable =
        await _sharedPreferencesHelper.isCitiesWeatherAvailable(state.cities);
    if (isCitiesAvailable) {
      final citiesWeather = await _sharedPreferencesHelper.getWeatherCities();
      state = state.copyWith(citiesWeather: citiesWeather);
    } else {
      _sharedPreferencesHelper.clearCitiesWeather();
      await fetchCitiesWeather(cities);
    }
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final location = await Geolocator.getCurrentPosition();
    state = state.copyWith(
      currentLatitude: location.latitude,
      currentLongitude: location.longitude,
    );
  }

  bool addCityToList(City city) {
    final cities = List<City>.from(state.cities);
    if (!isCityIdDuplicated(cities, city.id)) {
      cities.add(city);
      updateCities(cities);
      return true;
    }
    return false;
  }

  void removeCity(int index) {
    final cities = List<City>.from(state.cities);
    if (index < 0 || index >= cities.length) return;
    cities.removeAt(index);
    final tempWeatherList = List<Weather>.from(state.citiesWeather);
    tempWeatherList.removeAt(index);
    state = state.copyWith(cities: cities, citiesWeather: tempWeatherList);
    _sharedPreferencesHelper.saveWeatherCities(state.citiesWeather);
    _sharedPreferencesHelper.saveCities(state.cities);
  }

  Future<void> updateCities(List<City> cities) async {
    _sharedPreferencesHelper.saveCities(cities);
    state = state.copyWith(cities: cities);
    fetchCitiesWeather(cities);
  }

  String getCitiesIdsString() {
    String citiesIds = '';
    for (var city in state.cities) {
      citiesIds += '${city.id},';
    }
    return citiesIds;
  }

  bool isCityIdDuplicated(List<City> cities, int cityId) {
    return cities.any((city) => city.id == cityId);
  }

  Future<void> fetchCitiesWeather(List<City> cities) async {
    if (getCitiesIdsString().isEmpty) return;
    final weatherCities = await _getCurrentWeatherFromCityListUseCase.run(
      cities: getCitiesIdsString(),
    );
    weatherCities.sort((a, b) {
      int indexA = cities.indexWhere((city) => city.name == a.cityName);
      int indexB = cities.indexWhere((city) => city.name == b.cityName);
      return indexA.compareTo(indexB);
    });
    state = state.copyWith(citiesWeather: weatherCities);
    _sharedPreferencesHelper.saveWeatherCities(state.citiesWeather);
  }

  void reorderCity(int oldIndex, int newIndex) {
    final cities = List<City>.from(state.cities);
    final tempWeatherList = List<Weather>.from(state.citiesWeather);

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final city = cities.removeAt(oldIndex);
    final weather = tempWeatherList.removeAt(oldIndex);

    cities.insert(newIndex, city);
    tempWeatherList.insert(newIndex, weather);

    state = state.copyWith(cities: cities, citiesWeather: tempWeatherList);
    _sharedPreferencesHelper.saveWeatherCities(state.citiesWeather);
  }
}
