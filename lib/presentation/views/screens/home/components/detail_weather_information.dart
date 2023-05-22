import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../domain/entities/weather.dart';
import '../../../widgets/custom_container.dart';

class DetailWeatherInformation extends StatelessWidget {
  const DetailWeatherInformation({
    super.key,
    required this.weather,
  });

  final Weather weather;

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
                  margin: const EdgeInsets.only(right: 5, bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                weather.windDirection,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${weather.windSpd} m/s',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Image.asset(
                          'assets/images/compass.png',
                          width: 50,
                          height: 50,
                        )),
                      ]),
                ),
              ),
              Expanded(
                child: CustomContainer(
                    margin: const EdgeInsets.only(right: 5, top: 5),
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(weather.sunrise,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                )),
                            Text(weather.sunset,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/images/sunrise.svg',
                          width: 50,
                          height: 50,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    ])),
              ),
            ],
          ),
        )),
        Expanded(
          child: CustomContainer(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowDetailInformation(
                    'Feel like', weather.feelLike.toString(), '\u00b0'),
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
