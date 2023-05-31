import 'package:flutter/material.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/daily_forecast.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../../../domain/enums/units.dart';

class CityWeatherCard extends StatelessWidget {
  const CityWeatherCard(
      {super.key,
      required this.cityName,
      required this.aqi,
      required this.description,
      required this.temperature,
      required this.colorStart,
      required this.colorMid,
      required this.colorEnd,
      required this.temperatureUnit,
      required this.temperatureUnitString,
      required this.index,
      required this.onDismissed,
      required this.dailyForecasts});

  final String cityName;
  final int aqi;
  final String description;
  final double temperature;
  final Color colorStart;
  final Color colorMid;
  final Color colorEnd;
  final TemperatureUnit temperatureUnit;
  final String temperatureUnitString;
  final int index;
  final Function(int) onDismissed;
  final List<DailyForecast> dailyForecasts;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Remove city'),
              content: const Text('Are you sure you want to remove this city?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Remove'),
                ),
              ],
            );
          },
        );
      },
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        onDismissed(index);
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorStart,
                colorMid,
                colorEnd,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'AQI: $aqi $description',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
            Text(
              '${getTemp(temperature, temperatureUnit).toStringAsFixed(0)} $temperatureUnitString',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
