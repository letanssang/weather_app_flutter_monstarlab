import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_state.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../../../domain/entities/weather.dart';
import '../../../widgets/custom_container.dart';

class HourlyForecast extends StatelessWidget {
  final Weather weather;
  final Color? color;
  final SettingState settingState;
  const HourlyForecast({
    super.key,
    required this.weather,
    this.color,
    required this.settingState,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil().screenHeight;
    return CustomContainer(
      color: color,
      height: screenHeight * 0.33,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.today,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
              Text(
                DateFormat('MMM, d', settingState.locale.languageCode)
                    .format(weather.obTime),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenUtil().setSp(18),
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(16),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weather.hourlyForecasts.length,
                  itemExtent: ScreenUtil().setWidth(80),
                  itemBuilder: (context, index) {
                    return buildCardWeather(
                      '${getTemp(weather.hourlyForecasts[index].temperature, settingState.temperatureUnit).toStringAsFixed(0)}\u00b0',
                      'assets/images/weather_state/${weather.hourlyForecasts[index].weather.icon}.png',
                      getSpeed(weather.hourlyForecasts[index].windSpd,
                          settingState.speedUnit),
                      settingState.speedUnitString,
                      DateFormat('HH:mm')
                          .format(weather.hourlyForecasts[index].time),
                    );
                  })),
        ],
      ),
    );
  }

  Padding buildCardWeather(
    String temperature,
    String iconPath,
    double windSpd,
    String speedUnitString,
    String hour,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(temperature,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(18),
              )),
          Image.asset(
            iconPath,
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(50),
          ),
          Text(
            '${windSpd.toStringAsFixed(1)} $speedUnitString',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          Text(hour,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(14),
              )),
        ],
      ),
    );
  }
}
