import '../entities/weather.dart';

abstract class GetWeatherFromCityListUseCase {
  Future<List<Weather>> run({
    String? city,
    String? cities,
    String? units,
  });
}
