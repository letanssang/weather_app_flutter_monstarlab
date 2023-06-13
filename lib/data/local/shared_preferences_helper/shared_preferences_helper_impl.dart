import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/city.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/weather.dart';

class SharedPreferencesHelperImpl implements SharedPreferencesHelper {
  @override
  Future<bool> isCitiesWeatherAvailable(List<City> cities) async {
    final prefs = await SharedPreferences.getInstance();
    final lastTimeCitiesFetched = prefs.getString('lastTimeCitiesFetched');
    if (lastTimeCitiesFetched == null) return false;
    final now = DateTime.now();
    final citiesDate = DateTime.parse(lastTimeCitiesFetched);
    final differenceTime = now.difference(citiesDate).inMinutes;
    if (differenceTime > 30) return false;
    final citiesFromPrefs = await getWeatherCities();
    return listEquals(cities, citiesFromPrefs);
  }

  @override
  Future<void> saveCities(List<City> cities) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final citiesJson = json.encode(cities.map((e) => e.toJson()).toList());
      prefs.setString('cities', citiesJson);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<City>> getCities() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final citiesJson = prefs.getString('cities');
      if (citiesJson == null) return [];
      final cities = json.decode(citiesJson) as List;
      return cities.map((e) => City.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<Weather>> getWeatherCities() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final weathersJson = prefs.getString('weatherCities');
      if (weathersJson == null) return [];
      final weathers = json.decode(weathersJson) as List;
      return weathers.map((e) => Weather.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<void> saveWeatherCities(List<Weather> weatherCities) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final weathersJson =
          json.encode(weatherCities.map((e) => e.toJson()).toList());
      prefs.setString('weatherCities', weathersJson);
      prefs.setString('lastTimeCitiesFetched', DateTime.now().toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> clearCitiesWeather() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('weatherCities');
    prefs.remove('lastTimeCitiesFetched');
  }

  @override
  Future<String?> getPressureUnit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('pressureUnit');
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String?> getSpeedUnit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('speedUnit');
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String?> getTemperatureUnit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('temperatureUnit');
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> savePressureUnit(String unit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('pressureUnit', unit);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> saveSpeedUnit(String unit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('speedUnit', unit);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> saveTemperatureUnit(String unit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('temperatureUnit', unit);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<String?> getLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('language');
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> saveLanguage(String language) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('language', language);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
