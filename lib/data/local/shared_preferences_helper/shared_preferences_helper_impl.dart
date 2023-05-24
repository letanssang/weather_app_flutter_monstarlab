import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/weather.dart';

class SharedPreferencesHelperImpl implements SharedPreferencesHelper {
  @override
  Future<void> saveWeatherData(List<Weather> weathers) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final weathersJson =
          json.encode(weathers.map((e) => e.toJson()).toList());
      prefs.setString('weatherData', weathersJson);
      prefs.setString('lastTimeFetched', DateTime.now().toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Weather>> getWeatherData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final weathersJson = prefs.getString('weatherData');
      if (weathersJson == null) return [];
      final weathers = json.decode(weathersJson) as List;
      return weathers.map((e) => Weather.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isWeatherDataAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    final lastTimeFetched = prefs.getString('lastTimeFetched');
    if (lastTimeFetched == null) return false;
    final now = DateTime.now();
    final difference =
        now.difference(DateTime.parse(lastTimeFetched)).inMinutes;
    return difference < 10;
  }
}
