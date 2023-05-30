import '../entities/aqi.dart';

abstract class GetAQIDataUseCase {
  Future<List<AQI>> run({
    double? lat,
    double? lon,
    String? city,
  });
}
