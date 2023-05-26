import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/city.dart';
import 'package:weather_app_flutter_monstarlab/presentation/base/base_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/home/home_screen.dart';

import '../../data/local/shared_preferences_helper/shared_preferences_helper.dart';
import '../../domain/enums/weather_units.dart';

class BaseViewModel extends StateNotifier<BaseState> {
  final Ref _ref;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  BaseViewModel(
    this._ref,
    this._sharedPreferencesHelper,
  ) : super(const BaseState());

  void updateUnits(WeatherUnits units) {
    state = state.copyWith(units: units);
  }

  Future<void> init() async {
    await determinePosition();
    final cities = await _sharedPreferencesHelper.getCities();
    state = state.copyWith(cities: cities);
  }

  Future<void> determinePosition() async {
    Ref ref;
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
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

  Future<void> updateCities(List<City> cities) async {
    await _sharedPreferencesHelper.saveCities(cities);
    state = state.copyWith(cities: cities);
    await _ref.read(homeViewModelProvider.notifier).fetchWeathers();
  }

  String getCitiesIdsString() {
    String citiesIds = '';
    state.cities.forEach((city) {
      citiesIds += '${city.id},';
    });
    return citiesIds;
  }

  bool isCityIdDuplicated(List<City> cities, int cityId) {
    return cities.any((city) => city.id == cityId);
  }
}
