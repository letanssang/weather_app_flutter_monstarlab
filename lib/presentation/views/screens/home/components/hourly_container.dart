import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/hourly_forecast.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../widgets/custom_container.dart';

class HourForecast extends StatelessWidget {
  final List<HourlyForecast> hourlyForecasts;
  final DateTime date;
  final Color? color;
  final TemperatureUnit temperatureUnit;
  final SpeedUnit speedUnit;
  final String speedUnitString;
  const HourForecast({
    super.key,
    required this.hourlyForecasts,
    required this.date,
    this.color,
    required this.temperatureUnit,
    required this.speedUnit,
    required this.speedUnitString,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomContainer(
      color: color,
      height: screenHeight * 0.3,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                DateFormat('MMM, d').format(date),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hourlyForecasts.length,
                  itemExtent: 100,
                  itemBuilder: (context, index) {
                    return buildCardWeather(
                      '${getTemp(hourlyForecasts[index].temperature, temperatureUnit).toStringAsFixed(0)}\u00b0',
                      'assets/images/weather_state/${hourlyForecasts[index].weather.icon}.png',
                      getSpeed(hourlyForecasts[index].windSpd, speedUnit),
                      speedUnitString,
                      DateFormat('HH:mm').format(hourlyForecasts[index].time),
                    );
                  })),
        ],
      ),
    );
  }

  Padding buildCardWeather(
    String temperature,
    String iconPath,
    double windSpd,
    String speedUnitString,
    String hour,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(temperature,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              )),
          Image.asset(
            iconPath,
            width: 50,
            height: 50,
          ),
          Text(
            '${windSpd.toStringAsFixed(1)} $speedUnitString',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Text(hour,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              )),
        ],
      ),
    );
  }
}
