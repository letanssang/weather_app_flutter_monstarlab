import '../entities/weather.dart';

abstract class GetCurrentWeatherFromCityListUseCase {
  Future<List<Weather>> run({
    String? city,
    String? cities,
    String? units,
  });
}
