import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/daily_forecast.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';

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
              padding: EdgeInsets.all(15.0),
              child: Text(
                '7-day forecast',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemExtent: 150,
                  scrollDirection: Axis.horizontal,
                  itemCount: dailyForecasts.length,
                  itemBuilder: (context, index) {
                    final dailyForecast = dailyForecasts[index];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            DateFormat.Md().format(dailyForecast.date),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black45),
                          ),
                          Image.asset(
                            'assets/images/weather_state/${dailyForecast.weather.icon}.png',
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            '${getTemp(dailyForecast.maxTemperature, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnitString}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${getTemp(dailyForecast.minTemperature, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnitString}',
                            style: const TextStyle(
                              fontSize: 18,
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
