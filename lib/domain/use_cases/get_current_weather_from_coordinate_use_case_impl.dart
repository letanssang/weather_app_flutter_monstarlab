import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'get_current_weather_from_coordinate_use_case.dart';

class GetCurrentWeatherFromCoordinateUseCaseImpl
    implements GetCurrentWeatherFromCoordinateUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherFromCoordinateUseCaseImpl(this._weatherRepository);

  @override
  Future<Weather> run(
      {double? lat, double? lon, String? lang, String? units}) async {
    final weatherResponse =
        await _weatherRepository.getCurrentWeatherFromCoordinate(
      lat: lat,
      lon: lon,
      lang: lang,
      units: units,
    );
    final weather = weatherResponse.data[0];
    return weather;
  }
}
