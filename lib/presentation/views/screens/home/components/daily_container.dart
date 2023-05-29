import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/daily_forecast/daily_forecast_screen.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../../../domain/entities/daily_forecast.dart';
import '../../../widgets/custom_container.dart';

class DailyContainer extends StatelessWidget {
  final List<DailyForecast> dailyForecasts;
  final Color? color;
  final Color buttonColor;
  final TemperatureUnit temperatureUnit;
  const DailyContainer(
      {super.key,
      required this.dailyForecasts,
      this.color,
      required this.buttonColor,
      required this.temperatureUnit});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: color,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Next Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        DailyForecastScreen.routeName,
                        arguments: dailyForecasts);
                  },
                  icon: const Icon(Icons.calendar_month, color: Colors.white)),
            ],
          ),
          for (int i = 1; i < 4; i++)
            buildNextForecastItem(
              i == 1
                  ? 'Tomorrow'
                  : DateFormat('EEEE').format(dailyForecasts[i].date),
              dailyForecasts[i].weather.icon,
              dailyForecasts[i].weather.description,
              getTemp(dailyForecasts[i].maxTemperature, temperatureUnit),
              getTemp(dailyForecasts[i].minTemperature, temperatureUnit),
            ),
          ActionChip(
              elevation: 3,
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              label: const Text(
                '7-day forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(DailyForecastScreen.routeName,
                    arguments: dailyForecasts);
              }),
        ],
      ),
    );
  }

  Padding buildNextForecastItem(String date, String icon, String description,
      double maxTemp, double minTemp) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Image.asset('assets/images/weather_state/$icon.png',
                    width: 20, height: 20),
                const SizedBox(width: 5),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              description.length < 15 ? description : description.split(' ')[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              '${maxTemp.toStringAsFixed(0)}\u00b0 / ${minTemp.toStringAsFixed(0)}\u00b0',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
