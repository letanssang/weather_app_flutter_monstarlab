import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/custom_container.dart';

class DetailWeatherInformation extends StatelessWidget {
  final int humidity;
  final double windSpd;
  final Color? color;
  const DetailWeatherInformation(
      {Key? key, required this.humidity, required this.windSpd, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildWeatherInfoItem('assets/images/icons/rain.svg', '6%'),
          buildWeatherInfoItem(
              'assets/images/icons/humidity.svg', '$humidity%'),
          buildWeatherInfoItem('assets/images/icons/wind.svg', '$windSpd m/s'),
        ],
      ),
    );
  }

  Row buildWeatherInfoItem(
    String assetPath,
    String title,
  ) {
    return Row(
      children: [
        SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
