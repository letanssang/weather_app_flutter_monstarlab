import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'get_current_weather_from_city_list_use_case.dart';

class GetCurrentWeatherFromCityListUseCaseImpl
    implements GetCurrentWeatherFromCityListUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherFromCityListUseCaseImpl(this._weatherRepository);

  @override
  Future<List<Weather>> run(
      {String? city, String? cities, String? units}) async {
    final weatherResponse =
        await _weatherRepository.getCurrentWeatherFromCityList(
      city: city,
      cities: cities,
      units: units,
    );
    final weathers = weatherResponse.data;
    for (var weather in weathers) {
      final hourlyResponse = await _weatherRepository.getHourlyForecast(
        city: weather.cityName,
        hours: 24,
        units: units,
      );
      weather.hourlyForecasts = hourlyResponse.data;
      final dailyResponse = await _weatherRepository.getDailyForecast(
        city: weather.cityName,
        days: 7,
        units: units,
      );
      weather.dailyForecasts = dailyResponse.data;
    }
    return weathers;
  }
}
