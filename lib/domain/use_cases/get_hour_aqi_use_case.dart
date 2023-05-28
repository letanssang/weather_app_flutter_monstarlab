import 'package:weather_app_flutter_monstarlab/domain/entities/hourly_aqi.dart';

abstract class GetHourlyAQIUseCase {
  Future<List<HourlyAQI>> run({
    double? lat,
    double? lon,
    String? city,
    int? hours,
    String? units,
  });
}
