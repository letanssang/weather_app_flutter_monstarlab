import '../entities/weather.dart';

abstract class GetCurrentWeatherFromCityNameUseCase {
  Future<List<Weather>> run({
    String? city,
    String? lang,
    String? units,
  });
}
