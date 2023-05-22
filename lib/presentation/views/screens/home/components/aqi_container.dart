import 'package:flutter/material.dart';

import '../../../widgets/custom_container.dart';

class AQIContainer extends StatelessWidget {
  const AQIContainer({
    super.key,
    required this.aqi,
  });

  final int aqi;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
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
    );
  }
}
