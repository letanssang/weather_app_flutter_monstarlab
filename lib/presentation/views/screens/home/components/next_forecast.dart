import 'package:flutter/material.dart';

import '../../../widgets/custom_container.dart';

class NextForecast extends StatelessWidget {
  const NextForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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
          buildNextForecastItem(),
          buildNextForecastItem(),
          buildNextForecastItem(),
          ActionChip(
              backgroundColor: const Color(0xFF29B2DD),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              label: const Text(
                '5-day forecast',
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

  Padding buildNextForecastItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.sunny, color: Colors.white),
          Text(
            'Today Cloudy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(),
          Text(
            '38\u00b0 / 27\u00b0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
