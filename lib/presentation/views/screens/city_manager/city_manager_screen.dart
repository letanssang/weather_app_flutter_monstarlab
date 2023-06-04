import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/home/home_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/colors.dart';

import '../daily_forecast/daily_forecast_screen.dart';
import 'components/city_weather_card.dart';

class CityManagerScreen extends ConsumerWidget {
  static const routeName = '/city-manager';

  const CityManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(baseViewModelProvider);
    final settingState = ref.watch(settingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: ScreenUtil().setHeight(25),
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().screenWidth * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Manage cities',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(25),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
              child: Container(
                height: ScreenUtil().setHeight(50),
                margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(16),
                    horizontal: ScreenUtil().setWidth(10)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(10),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(20)),
                      child:
                          Icon(Icons.search, size: ScreenUtil().setHeight(20)),
                    ),
                    Text(
                      'Enter location',
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: ScreenUtil().setSp(14)),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                proxyDecorator: (child, index, animation) => child,
                onReorder: (oldIndex, newIndex) {
                  ref
                      .read(baseViewModelProvider.notifier)
                      .reorderCity(oldIndex, newIndex);
                },
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                itemCount: state.citiesWeather.length,
                itemBuilder: (context, index) {
                  final cityWeather = state.citiesWeather[index];
                  return GestureDetector(
                    key: ValueKey(cityWeather.cityName),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        DailyForecastScreen.routeName,
                        arguments: cityWeather.dailyForecasts,
                      );
                    },
                    child: ReorderableDelayedDragStartListener(
                      index: index,
                      child: CityWeatherCard(
                        key: ValueKey(cityWeather.cityName),
                        cityName: cityWeather.cityName,
                        aqi: cityWeather.aqi,
                        description: cityWeather.weather.description,
                        temperature: cityWeather.temperature,
                        colorStart:
                            weatherColors[cityWeather.weather.code ~/ 100]
                                .startColor,
                        colorMid: weatherColors[cityWeather.weather.code ~/ 100]
                            .midColor,
                        colorEnd: weatherColors[cityWeather.weather.code ~/ 100]
                            .endColor,
                        temperatureUnit: settingState.temperatureUnit,
                        temperatureUnitString:
                            settingState.temperatureUnitString,
                        index: index,
                        onDismissed: (index) {
                          ref
                              .read(baseViewModelProvider.notifier)
                              .removeCity(index);
                        },
                        dailyForecasts: cityWeather.dailyForecasts,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
