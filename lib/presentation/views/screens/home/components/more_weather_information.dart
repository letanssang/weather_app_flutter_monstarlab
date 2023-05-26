import 'package:flutter/material.dart';

import '../../../../../domain/entities/weather.dart';
import '../../../widgets/custom_container.dart';

class MoreWeatherInformation extends StatelessWidget {
  const MoreWeatherInformation({super.key, required this.weather, this.color});

  final Weather weather;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomContainer(
                  color: color,
                  margin: const EdgeInsets.only(right: 5, bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Feels like',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${weather.feelLike}\u00b0',
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: CustomContainer(
                    color: color,
                    margin: const EdgeInsets.only(right: 5, top: 5),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(weather.sunrise,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              Text('Sunrise',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white70,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(weather.sunset,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              Text('Sunset',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white70,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        )),
        Expanded(
          child: CustomContainer(
            padding: const EdgeInsets.all(20),
            color: color,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowDetailInformation(
                    'Visibility', weather.visibility.toString(), 'km'),
                buildRowDetailInformation(
                    'UV', weather.uv.toStringAsFixed(0), ''),
                buildRowDetailInformation(
                    'Pressure', weather.pressure.toStringAsFixed(2), 'mb'),
                buildRowDetailInformation(
                    'Clouds', weather.clouds.toStringAsFixed(0), '%'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Column buildRowDetailInformation(String title, String value, String unit) =>
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                )),
            Text('$value $unit',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
          ],
        ),
        const Divider(
          color: Colors.white70,
          thickness: 1,
        ),
      ],
    );
