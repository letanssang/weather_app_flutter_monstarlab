import '../entities/aqi.dart';
import '../repositories/weather_repository.dart';
import 'get_aqi_data_use_case.dart';

class GetAQIDataUseCaseImpl implements GetAQIDataUseCase {
  final WeatherRepository _weatherRepository;

  GetAQIDataUseCaseImpl(this._weatherRepository);

  @override
  Future<List<AQI>> run({double? lat, double? lon, String? city}) async {
    final aqiResponse = await _weatherRepository.getCurrentAQI(
      lat: lat,
      lon: lon,
      city: city,
    );
    final aqi = aqiResponse.data;
    return aqi;
  }
}
