import '../entities/weather.dart';

abstract class GetCurrentWeatherFromCoordinateUseCase {
  Future<Weather> run({
    double? lat,
    double? lon,
    String? lang,
    String? units,
  });
}
