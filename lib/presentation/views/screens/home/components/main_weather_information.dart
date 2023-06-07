import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/get_weather_description_locale.dart';

import '../../../../../utils/functions/convert_unit.dart';

class MainWeatherInformation extends StatelessWidget {
  final String icon;
  final int code;
  final double temp;
  final String description;
  final double maxTemp;
  final double minTemp;
  final TemperatureUnit temperatureUnit;
  final String temperatureUnitString;
  final Locale locale;

  const MainWeatherInformation(
      {super.key,
      required this.icon,
      required this.code,
      required this.temp,
      required this.description,
      required this.maxTemp,
      required this.minTemp,
      required this.temperatureUnit,
      required this.temperatureUnitString,
      required this.locale});

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Text(
              getTemp(temp, temperatureUnit).toStringAsFixed(0),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(64),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  temperatureUnitString,
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                ),
              ),
            )
          ],
        ),
        Text(
          getWeatherDescriptionLocale(code, context),
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '${getTemp(maxTemp, temperatureUnit).toStringAsFixed(0)}\u00b0 / ${getTemp(minTemp, temperatureUnit).toStringAsFixed(0)}\u00b0',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(20),
            ),
          ),
        ),
      ],
    );
  }
}
