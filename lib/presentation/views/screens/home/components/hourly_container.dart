import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/hourly_forecast.dart';

import '../../../widgets/custom_container.dart';

class HourForecast extends StatelessWidget {
  final List<HourlyForecast> hourlyForecasts;
  final DateTime date;
  const HourForecast({
    super.key,
    required this.hourlyForecasts,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomContainer(
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
                      '${hourlyForecasts[index].temperature}\u00b0',
                      'assets/images/weather_state/${hourlyForecasts[index].weather.icon}.png',
                      hourlyForecasts[index].windSpd,
                      DateFormat('HH:mm').format(hourlyForecasts[index].time),
                    );
                  })),
        ],
      ),
    );
  }

  Column buildCardWeather(
    String temperature,
    String iconPath,
    double windSpd,
    String hour,
  ) {
    return Column(
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
          '${windSpd} m/s',
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
    );
  }
}
