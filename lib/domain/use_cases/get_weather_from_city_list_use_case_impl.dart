import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'get_weather_from_city_list_use_case.dart';

class GetWeatherFromCityListUseCaseImpl
    implements GetWeatherFromCityListUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherFromCityListUseCaseImpl(this._weatherRepository);

  @override
  Future<List<Weather>> run(
      {String? city, String? cities, String? units}) async {
    final weatherResponse =
        await _weatherRepository.getCurrentWeatherFromCityList(
      city: city,
      cities: cities,
    );
    final weathers = weatherResponse.data;
    for (var weather in weathers) {
      final hourlyResponse = await _weatherRepository.getHourlyForecast(
        city: weather.cityName,
        hours: 24,
      );
      weather.hourlyForecasts = hourlyResponse.data;
      final dailyResponse = await _weatherRepository.getDailyForecast(
        city: weather.cityName,
        days: 7,
      );
      weather.dailyForecasts = dailyResponse.data;
    }
    return weathers;
  }
}
