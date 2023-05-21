import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_container.dart';
import 'components/hour_forecast.dart';
import 'components/next_forecast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: const Color(0xFF29B2DD),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 32),
        ),
        title: Center(
          child: Text('Hanoi',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              )),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 32),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 40,
          right: 40,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF29B2DD),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: const [
                  Image(image: AssetImage('assets/images/sun.png')),
                  Text(
                    '28\u00b0',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Clear',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Max: 31\u00b0 Min: 20\u00b0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildWeatherInfoItem('assets/images/icons/rain.svg', '6%'),
                    buildWeatherInfoItem(
                        'assets/images/icons/humidity.svg', '67%'),
                    buildWeatherInfoItem(
                        'assets/images/icons/wind.svg', '25 km/h')
                  ],
                ),
              ),
              const HourForecast(),
              const NextForecast(),
            ],
          ),
        ),
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
