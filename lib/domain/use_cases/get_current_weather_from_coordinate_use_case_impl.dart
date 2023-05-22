import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import 'get_current_weather_from_coordinate_use_case.dart';

class GetCurrentWeatherFromCoordinateUseCaseImpl
    implements GetCurrentWeatherFromCoordinateUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherFromCoordinateUseCaseImpl(this._weatherRepository);

  @override
  Future<List<Weather>> run({double? lat, double? lon, String? units}) async {
    final weatherResponse =
        await _weatherRepository.getCurrentWeatherFromCoordinate(
      lat: lat,
      lon: lon,
      units: units,
    );
    final weather = weatherResponse.data;
    return weather;
  }
}
