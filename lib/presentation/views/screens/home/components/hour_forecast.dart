import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/custom_container.dart';

class HourForecast extends StatelessWidget {
  const HourForecast({
    super.key,
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
            children: const [
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                'Mar, 10',
                style: TextStyle(
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCardWeather(
                    '31\u00b0C', 'assets/images/weather_icon.svg', '12:00'),
                buildCardWeather(
                    '31\u00b0C', 'assets/images/weather_icon.svg', '12:00'),
                buildCardWeather(
                    '31\u00b0C', 'assets/images/weather_icon.svg', '12:00'),
                buildCardWeather(
                    '31\u00b0C', 'assets/images/weather_icon.svg', '12:00'),
                buildCardWeather(
                    '31\u00b0C', 'assets/images/weather_icon.svg', '12:00'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildCardWeather(
    String temperature,
    String iconPath,
    String hour,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(temperature,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            )),
        SvgPicture.asset(
          iconPath,
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
