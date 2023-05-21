import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'get_current_weather_from_city_name_use_case.dart';

class GetCurrentWeatherFromCityNameUseCaseImpl
    implements GetCurrentWeatherFromCityNameUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherFromCityNameUseCaseImpl(this._weatherRepository);

  @override
  Future<List<Weather>> run(
      {String? city, String? cities, String? lang, String? units}) async {
    final weatherResponse =
        await _weatherRepository.getCurrentWeatherFromCityName(
      city: city,
      cities: cities,
      lang: lang,
      units: units,
    );
    final weather = weatherResponse.data;
    return weather;
  }
}
