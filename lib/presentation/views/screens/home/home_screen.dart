import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/home/components/detail_weather_information.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/colors.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/use_cases/get_weather_from_city_list_use_case.dart';
import '../../../../domain/use_cases/get_weather_from_coordinate_use_case.dart';
import '../../../base/base_state.dart';
import '../../../base/base_view_model.dart';
import 'components/aqi_container.dart';
import 'components/daily_container.dart';
import 'components/hourly_container.dart';
import 'components/main_weather_information.dart';
import 'components/more_weather_information.dart';
import 'home_state.dart';
import 'home_view_model.dart';

final baseViewModelProvider =
    StateNotifierProvider<BaseViewModel, BaseState>((ref) => BaseViewModel(
          ref,
          getIt<SharedPreferencesHelper>(),
          getIt<GetWeatherFromCityListUseCase>(),
        ));
final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel(
          ref,
          getIt<GetWeatherFromCoordinateUseCase>(),
        ));

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() async {
    await ref.read(baseViewModelProvider.notifier).init();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(homeViewModelProvider.notifier).fetchWeathers();
    });
  }

  @override
  void dispose() {
    ref.watch(homeViewModelProvider).pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final citiesWeather = ref.watch(baseViewModelProvider).citiesWeather;
    final weathers = [...state.locationWeather, ...citiesWeather];
    return state.fetchingState != FetchingState.success
        ? state.fetchingState == FetchingState.failure
            ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Something went wrong'),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(homeViewModelProvider.notifier)
                              .fetchWeathers();
                        },
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                color: const Color(0xFF29B2DD),
                child: const CustomLoadingIndicator())
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: weatherColors[
                      weathers[state.currentPage.toInt()].weather.code ~/ 100]
                  .startColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/city-manager');
                },
                icon: const Icon(Icons.add, size: 32),
              ),
              centerTitle: true,
              title: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.currentPage.toInt() == 0)
                          const Icon(Icons.location_on, size: 20),
                        Text(weathers[state.currentPage.toInt()].cityName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ),
                DotsIndicator(
                  dotsCount: weathers.length,
                  position: state.currentPage,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(15.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    activeColor: Colors.white,
                    color: Colors.white.withOpacity(.5),
                    spacing: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                )
              ]),
              actions: [
                PopupMenuButton<String>(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  onSelected: (String item) {
                    if (item == 'Setting') {
                      Navigator.of(context).pushNamed('/setting');
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Share',
                      child: Text('Share'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Setting',
                      child: Text('Setting'),
                    ),
                  ],
                ),
              ],
            ),
            body: PageView.builder(
              controller: state.pageController,
              itemCount: weathers.length,
              itemBuilder: (context, index) {
                final weather = weathers[index];
                final colorIndex = weather.weather.code ~/ 100;
                return RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(homeViewModelProvider.notifier)
                        .fetchWeathers();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          weatherColors[colorIndex].startColor,
                          weatherColors[colorIndex].midColor,
                          weatherColors[colorIndex].endColor,
                        ])),
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MainWeatherInformation(
                            icon: weather.weather.icon,
                            temp: weather.temperature,
                            description: weather.weather.description,
                            maxTemp: weather.dailyForecasts[0].maxTemperature,
                            minTemp: weather.dailyForecasts[0].minTemperature,
                          ),
                          DetailWeatherInformation(
                            humidity: weather.humidity,
                            windSpd: weather.windSpd,
                            pop: weather.hourlyForecasts.first.pop,
                            color: weatherColors[colorIndex].foregroundColor,
                          ),
                          HourForecast(
                            hourlyForecasts: weather.hourlyForecasts,
                            date: weather.obTime,
                            color: weatherColors[colorIndex].foregroundColor,
                          ),
                          DailyContainer(
                            dailyForecasts: weather.dailyForecasts,
                            color: weatherColors[colorIndex].foregroundColor,
                            buttonColor: weatherColors[colorIndex].endColor,
                          ),
                          MoreWeatherInformation(
                              weather: weather,
                              color: weatherColors[colorIndex].foregroundColor),
                          AQIContainer(
                            aqi: weather.aqi,
                            color: weatherColors[colorIndex].foregroundColor,
                            cityName: weather.cityName,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
