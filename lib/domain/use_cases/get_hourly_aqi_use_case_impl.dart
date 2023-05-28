import '../entities/hourly_aqi.dart';
import '../repositories/weather_repository.dart';
import 'get_hour_aqi_use_case.dart';

class GetHourlyAQIUseCaseImpl implements GetHourlyAQIUseCase {
  final WeatherRepository _weatherRepository;

  GetHourlyAQIUseCaseImpl(this._weatherRepository);

  @override
  Future<List<HourlyAQI>> run(
      {double? lat,
      double? lon,
      String? city,
      int? hours,
      String? units}) async {
    final aqiResponse = await _weatherRepository.getHourlyAQI(
      lat: lat,
      lon: lon,
      city: city,
      hours: hours,
      units: units,
    );
    final aqi = aqiResponse.data;
    return aqi;
  }
}
