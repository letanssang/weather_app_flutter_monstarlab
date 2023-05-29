import 'package:flutter/material.dart';

import '../../../widgets/custom_container.dart';

class AQIContainer extends StatelessWidget {
  const AQIContainer(
      {super.key, required this.aqi, this.color, required this.cityName});

  final int aqi;
  final Color? color;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/aqi', arguments: cityName);
      },
      child: CustomContainer(
        color: color,
        margin: const EdgeInsets.only(bottom: 40, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.eco, color: Colors.white),
                Text(' AQI $aqi',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ],
            ),
            const Row(
              children: [
                Text('Full air quality forecast ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Colors.white70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
