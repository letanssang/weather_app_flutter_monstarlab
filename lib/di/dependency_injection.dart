import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_flutter_monstarlab/data/local/database_helper/database_helper.dart';
import 'package:weather_app_flutter_monstarlab/data/local/database_helper/database_helper_impl.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper_impl.dart';
import 'package:weather_app_flutter_monstarlab/data/remote/weather_api_client.dart';

import '../data/repositories/weather_repository_impl.dart';
import '../domain/repositories/weather_repository.dart';
import '../domain/use_cases/get_current_weather_from_city_list_use_case.dart';
import '../domain/use_cases/get_current_weather_from_city_list_use_case_impl.dart';
import '../domain/use_cases/get_current_weather_from_coordinate_use_case.dart';
import '../domain/use_cases/get_current_weather_from_coordinate_use_case_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  //register services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<WeatherApiClient>(
      () => WeatherApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelperImpl());
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelperImpl());
  //register repositories
  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(getIt<WeatherApiClient>()));
  //register use cases
  getIt.registerLazySingleton<GetCurrentWeatherFromCoordinateUseCase>(() =>
      GetCurrentWeatherFromCoordinateUseCaseImpl(getIt<WeatherRepository>()));
  getIt.registerLazySingleton<GetCurrentWeatherFromCityListUseCase>(() =>
      GetCurrentWeatherFromCityListUseCaseImpl(getIt<WeatherRepository>()));
}
