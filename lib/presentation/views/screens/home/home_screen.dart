import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/weather.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/home/components/detail_weather_information.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/colors.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/numbers.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../domain/enums/fetching_state.dart';
import '../../../../domain/enums/location_permission_state.dart';
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
          getIt<SharedPreferencesHelper>(),
          getIt<GetWeatherFromCityListUseCase>(),
        ));
final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
        (ref) => HomeViewModel(
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
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      ref
          .read(homeViewModelProvider.notifier)
          .onPageChanged(pageController.page!);
    });
  }

  void showLocationPermissionDialog(String title, String content,
      Function() onPressed, BuildContext buildContext) {
    showDialog(
      context: buildContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          Center(
              child: TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await onPressed();
                  },
                  child: const Text('Ok')))
        ],
      ),
    );
  }

  Future<void> refresh() async {
    await ref.read(baseViewModelProvider.notifier).determinePosition();
    await ref.read(homeViewModelProvider.notifier).fetchWeathers();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeViewModelProvider.select((value) => value.currentPage),
        (_, next) {
      if (next % 1 == 0 && next < maxCities) {
        pageController.jumpToPage(next.round());
      }
    });
    ref.listen(
        baseViewModelProvider.select((value) => value.locationPermissionState),
        (_, next) {
      if (next == LocationPermissionState.denied) {
        showLocationPermissionDialog(
            AppLocalizations.of(context)!.locationPermissionTitle,
            AppLocalizations.of(context)!.locationPermissionDescription,
            openAppSettings,
            context);
      } else if (next == LocationPermissionState.disabled) {
        showLocationPermissionDialog(
            AppLocalizations.of(context)!.locationDisableTitle,
            AppLocalizations.of(context)!.locationDisableDescription,
            Geolocator.openLocationSettings,
            context);
      } else if (next == LocationPermissionState.granted) {
        refresh();
      }
    });
    final state = ref.watch(homeViewModelProvider);
    final citiesWeather = ref.watch(baseViewModelProvider).citiesWeather;
    final weathers = [...state.locationWeather, ...citiesWeather];
    final settings = ref.watch(settingViewModelProvider);
    return state.fetchingState != FetchingState.success
        ? state.fetchingState == FetchingState.failure
            ? buildLoadingFailScreen(context)
            : Container(
                color: const Color(0xFF29B2DD),
                child: const CustomLoadingIndicator())
        : Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: weathers.length,
                  itemBuilder: (context, index) {
                    final weather = weathers[index];
                    final colorIndex = weather.weather.code ~/ 100;
                    return RefreshIndicator(
                      onRefresh: refresh,
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
                        padding: EdgeInsets.only(
                          left: ScreenUtil().screenWidth * 0.02,
                          right: ScreenUtil().screenWidth * 0.02,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: ScreenUtil().screenHeight * 0.1,
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().statusBarHeight),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/city-manager');
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: ScreenUtil().setHeight(25),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (index == 0)
                                          Icon(Icons.location_on,
                                              size: ScreenUtil().setHeight(20),
                                              color: Colors.white),
                                        Text(weather.cityName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(20),
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    icon: Icon(
                                      Icons.more_vert,
                                      size: ScreenUtil().setHeight(25),
                                      color: Colors.white,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    onSelected: (String item) {
                                      if (item == 'Setting') {
                                        Navigator.of(context)
                                            .pushNamed('/setting');
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: 'Share',
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .share),
                                      ),
                                      PopupMenuItem<String>(
                                          value: 'Setting',
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .setting)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    MainWeatherInformation(
                                      weather: weather,
                                      settingState: settings,
                                    ),
                                    DetailWeatherInformation(
                                      weather: weather,
                                      color: weatherColors[colorIndex]
                                          .foregroundColor,
                                      settingState: settings,
                                    ),
                                    HourlyForecast(
                                      weather: weather,
                                      color: weatherColors[colorIndex]
                                          .foregroundColor,
                                      settingState: settings,
                                    ),
                                    DailyContainer(
                                      dailyForecasts: weather.dailyForecasts,
                                      color: weatherColors[colorIndex]
                                          .foregroundColor,
                                      buttonColor:
                                          weatherColors[colorIndex].endColor,
                                      temperatureUnit: settings.temperatureUnit,
                                    ),
                                    MoreWeatherInformation(
                                      weather: weather,
                                      color: weatherColors[colorIndex]
                                          .foregroundColor,
                                      settingState: settings,
                                    ),
                                    AQIContainer(
                                      aqi: weather.aqi,
                                      color: weatherColors[colorIndex]
                                          .foregroundColor,
                                      cityName: weather.cityName,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                buildDotsIndicator(weathers)
              ],
            ),
          );
  }

  Align buildDotsIndicator(List<Weather> weathers) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().screenHeight * 0.1),
        child: DotsIndicator(
          dotsCount: weathers.length,
          position: pageController.hasClients ? pageController.page ?? 0 : 0,
          decorator: DotsDecorator(
            size: Size.square(ScreenUtil().setHeight(9)),
            activeSize:
                Size(ScreenUtil().setHeight(15), ScreenUtil().setHeight(9)),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil().setHeight(5)),
            ),
            activeColor: Colors.white,
            color: Colors.white.withOpacity(.5),
            spacing:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(4)),
          ),
        ),
      ),
    );
  }

  Scaffold buildLoadingFailScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.somethingWrong),
            TextButton(
              onPressed: () {
                ref.read(homeViewModelProvider.notifier).fetchWeathers();
              },
              child: Text(AppLocalizations.of(context)!.retry),
            )
          ],
        ),
      ),
    );
  }
}
