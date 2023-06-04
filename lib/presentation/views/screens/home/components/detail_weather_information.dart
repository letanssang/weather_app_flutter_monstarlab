import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../widgets/custom_container.dart';

class DetailWeatherInformation extends StatelessWidget {
  final int humidity;
  final double windSpd;
  final int pop;
  final Color? color;
  final SpeedUnit speedUnit;
  final String speedUnitString;
  const DetailWeatherInformation(
      {Key? key,
      required this.humidity,
      required this.windSpd,
      required this.pop,
      required this.speedUnit,
      required this.speedUnitString,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: color,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.005),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildWeatherInfoItem(
            'assets/images/icons/rain.svg',
            '$pop%',
          ),
          buildWeatherInfoItem(
            'assets/images/icons/humidity.svg',
            '$humidity%',
          ),
          buildWeatherInfoItem(
            'assets/images/icons/wind.svg',
            '${getSpeed(windSpd, speedUnit).toStringAsFixed(1)} $speedUnitString',
          ),
        ],
      ),
    );
  }

  Row buildWeatherInfoItem(String assetPath, String title) {
    return Row(
      children: [
        SvgPicture.asset(
          assetPath,
          width: ScreenUtil().setWidth(20),
          height: ScreenUtil().setHeight(20),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(14),
          ),
        )
      ],
    );
  }
}
