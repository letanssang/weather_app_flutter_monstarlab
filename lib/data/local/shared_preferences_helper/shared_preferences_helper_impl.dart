import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/city.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/weather.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';

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
  Future<PressureUnit?> getPressureUnit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pressureUnitString = prefs.getString('pressureUnit');
      if (pressureUnitString == null) return null;
      final pressureUnit =
          EnumToString.fromString(PressureUnit.values, pressureUnitString);
      return pressureUnit;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<SpeedUnit?> getSpeedUnit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final speedUnitString = prefs.getString('speedUnit');
      if (speedUnitString == null) return null;
      final speedUnit =
          EnumToString.fromString(SpeedUnit.values, speedUnitString);
      return speedUnit;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<TemperatureUnit?> getTemperatureUnit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final temperatureUnitString = prefs.getString('temperatureUnit');
      if (temperatureUnitString == null) return null;
      final temperatureUnit = EnumToString.fromString(
          TemperatureUnit.values, temperatureUnitString);
      return temperatureUnit;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> savePressureUnit(PressureUnit pressureUnit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pressureUnitString = EnumToString.convertToString(pressureUnit);
      prefs.setString('pressureUnit', pressureUnitString);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> saveSpeedUnit(SpeedUnit speedUnit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final speedUnitString = EnumToString.convertToString(speedUnit);
      prefs.setString('speedUnit', speedUnitString);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> saveTemperatureUnit(TemperatureUnit temperatureUnit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final temperatureUnitString =
          EnumToString.convertToString(temperatureUnit);
      prefs.setString('temperatureUnit', temperatureUnitString);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Language?> getLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageString = prefs.getString('language');
      if (languageString == null) return null;
      final language = EnumToString.fromString(Language.values, languageString);
      return language;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> saveLanguage(Language language) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageString = EnumToString.convertToString(language);
      prefs.setString('language', languageString);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
