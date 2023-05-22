import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/use_cases/get_current_weather_from_city_list_use_case.dart';
import '../../../../domain/use_cases/get_current_weather_from_coordinate_use_case.dart';
import '../../../base/base_state.dart';
import '../../../base/base_view_model.dart';
import '../../widgets/custom_container.dart';
import 'components/aqi_container.dart';
import 'components/daily_container.dart';
import 'components/detail_weather_information.dart';
import 'components/hourly_container.dart';
import 'home_state.dart';
import 'home_view_model.dart';

final baseViewModelProvider =
    StateNotifierProvider<BaseViewModel, BaseState>((ref) => BaseViewModel());
final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel(
          ref,
          getIt<GetCurrentWeatherFromCoordinateUseCase>(),
          getIt<GetCurrentWeatherFromCityListUseCase>(),
        ));

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await ref.read(baseViewModelProvider.notifier).init();
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeViewModel = ref.read(homeViewModelProvider.notifier);
      homeViewModel.fetchWeathers();
    });
    final state = ref.watch(homeViewModelProvider);
    state.pageController.addListener(() {
      ref
          .read(homeViewModelProvider.notifier)
          .onPageChanged(state.pageController.page!);
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
    return state.fetchingState != FetchingState.success
        ? Container(
            color: const Color(0xFF29B2DD),
            child: const Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFF29B2DD),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 32),
              ),
              title: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child:
                        Text(state.weathers[state.currentPage.toInt()].cityName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            )),
                  ),
                ),
                DotsIndicator(
                  dotsCount: state.weathers.length,
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, size: 32),
                ),
              ],
            ),
            body: PageView.builder(
              controller: state.pageController,
              itemCount: state.weathers.length,
              itemBuilder: (context, index) {
                final weather = state.weathers[index];
                return Container(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 10,
                    right: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF29B2DD),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/weather_state/${weather.weather.icon}.png',
                              width: 125,
                              fit: BoxFit.fitWidth,
                            ),
                            Text(
                              '${weather.temperature}\u00b0',
                              style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                weather.weather.description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomContainer(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildWeatherInfoItem(
                                  'assets/images/icons/rain.svg', '6%'),
                              buildWeatherInfoItem(
                                  'assets/images/icons/humidity.svg',
                                  '${weather.humidity}%'),
                              buildWeatherInfoItem(
                                  'assets/images/icons/wind.svg',
                                  '${weather.windSpd} m/s'),
                            ],
                          ),
                        ),
                        HourForecast(
                            hourlyForecasts: weather.hourlyForecasts,
                            date: weather.obTime),
                        DailyContainer(dailyForecasts: weather.dailyForecasts),
                        DetailWeatherInformation(weather: weather),
                        AQIContainer(aqi: weather.aqi),
                      ],
                    ),
                  ),
                );
              },
            ));
  }

  Row buildWeatherInfoItem(
    String assetPath,
    String title,
  ) {
    return Row(
      children: [
        SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
