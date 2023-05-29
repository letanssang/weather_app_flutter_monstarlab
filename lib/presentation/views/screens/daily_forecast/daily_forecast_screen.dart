import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/daily_forecast.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/colors.dart';

import '../../../../utils/functions/convert_unit.dart';

class DailyForecastScreen extends ConsumerWidget {
  static const routeName = '/daily-forecast';

  const DailyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyForecasts =
        ModalRoute.of(context)!.settings.arguments as List<DailyForecast>;
    final settingState = ref.watch(settingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '7-day forecast',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: ListView.builder(
                  itemExtent: 150,
                  scrollDirection: Axis.horizontal,
                  itemCount: dailyForecasts.length,
                  itemBuilder: (context, index) {
                    final dailyForecast = dailyForecasts[index];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              weatherColors[dailyForecast.weather.code ~/ 100]
                                  .startColor,
                              weatherColors[dailyForecast.weather.code ~/ 100]
                                  .midColor,
                              weatherColors[dailyForecast.weather.code ~/ 100]
                                  .endColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white70,
                            width: 0.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0,
                                  3), // Điều chỉnh vị trí đổ bóng (ngang, dọc)
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            index == 0
                                ? 'Today'
                                : index == 1
                                    ? 'Tomorrow'
                                    : DateFormat.E().format(dailyForecast.date),
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.Md().format(dailyForecast.date),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/images/weather_state/${dailyForecast.weather.icon}.png',
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            '${getTemp(dailyForecast.maxTemperature, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnitString}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${getTemp(dailyForecast.minTemperature, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnitString}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/icons/wind.svg',
                                width: 20,
                                height: 20,
                              ),
                              Text(
                                '${getSpeed(dailyForecast.windSpd, settingState.speedUnit).toStringAsFixed(0)} ${settingState.speedUnitString}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            dailyForecast.weather.description,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Flexible(child: Container()),
          ],
        ),
      ),
    );
  }
}
