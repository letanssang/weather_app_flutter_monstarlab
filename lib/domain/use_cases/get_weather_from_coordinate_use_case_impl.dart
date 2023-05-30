import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'get_weather_from_coordinate_use_case.dart';

class GetWeatherFromCoordinateUseCaseImpl
    implements GetWeatherFromCoordinateUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherFromCoordinateUseCaseImpl(this._weatherRepository);

  @override
  Future<List<Weather>> run({double? lat, double? lon}) async {
    final weatherResponse =
        await _weatherRepository.getCurrentWeatherFromCoordinate(
      lat: lat,
      lon: lon,
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
