import '../entities/weather.dart';

abstract class GetCurrentWeatherFromCoordinateUseCase {
  Future<List<Weather>> run({
    double? lat,
    double? lon,
    String? units,
  });
}
