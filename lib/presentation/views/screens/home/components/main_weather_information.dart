import 'package:flutter/material.dart';

class MainWeatherInformation extends StatelessWidget {
  final String icon;
  final double temp;
  final String description;
  final double maxTemp;
  final double minTemp;
  const MainWeatherInformation({
    super.key,
    required this.icon,
    required this.temp,
    required this.description,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Image.asset(
            'assets/images/weather_state/$icon.png',
            width: 125,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          '$temp\u00b0',
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Max: ${maxTemp.toStringAsFixed(0)}\u00b0 Min: ${minTemp.toStringAsFixed(0)}\u00b0',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
