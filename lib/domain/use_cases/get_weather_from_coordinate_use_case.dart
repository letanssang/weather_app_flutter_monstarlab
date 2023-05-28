import '../entities/weather.dart';

abstract class GetWeatherFromCoordinateUseCase {
  Future<List<Weather>> run({
    double? lat,
    double? lon,
    String? units,
  });
}
