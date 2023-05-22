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
    final weather = weatherResponse.data;
    return weather;
  }
}
