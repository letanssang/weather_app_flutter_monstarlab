import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_state.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/get_weather_description_locale.dart';

import '../../../../../domain/entities/weather.dart';
import '../../../../../utils/functions/convert_unit.dart';

class MainWeatherInformation extends StatelessWidget {
  final Weather weather;
  final SettingState settingState;

  const MainWeatherInformation(
      {super.key, required this.weather, required this.settingState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Image.asset(
            'assets/images/weather_state/${weather.weather.icon}.png',
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
              getTemp(weather.temperature, settingState.temperatureUnit)
                  .toStringAsFixed(0),
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
                  settingState.temperatureUnitString,
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                ),
              ),
            )
          ],
        ),
        Text(
          getWeatherDescriptionLocale(weather.weather.code, context),
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '${getTemp(weather.dailyForecasts[0].maxTemperature, settingState.temperatureUnit).toStringAsFixed(0)}\u00b0 / ${getTemp(weather.dailyForecasts[0].minTemperature, settingState.temperatureUnit).toStringAsFixed(0)}\u00b0',
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
