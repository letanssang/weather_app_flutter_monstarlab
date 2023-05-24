import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/entities/daily_forecast.dart';
import '../../../widgets/custom_container.dart';

class DailyContainer extends StatelessWidget {
  final List<DailyForecast> dailyForecasts;
  final Color? color;
  final Color buttonColor;
  const DailyContainer(
      {super.key,
      required this.dailyForecasts,
      this.color,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: color,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Icon(Icons.calendar_month, color: Colors.white),
            ],
          ),
          for (int i = 1; i < 4; i++)
            buildNextForecastItem(
              DateFormat('EEEE').format(dailyForecasts[i].date),
              dailyForecasts[i].weather.icon,
              dailyForecasts[i].weather.description,
              dailyForecasts[i].maxTemperature,
              dailyForecasts[i].minTemperature,
            ),
          ActionChip(
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              label: const Text(
                '7-day forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {}),
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
            flex: 4,
            child: Text(
              description,
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
