import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/hourly_forecast.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../widgets/custom_container.dart';

class HourForecast extends StatelessWidget {
  final List<HourlyForecast> hourlyForecasts;
  final DateTime date;
  final String locale;
  final Color? color;
  final TemperatureUnit temperatureUnit;
  final SpeedUnit speedUnit;
  final String speedUnitString;
  const HourForecast({
    super.key,
    required this.hourlyForecasts,
    required this.date,
    required this.locale,
    this.color,
    required this.temperatureUnit,
    required this.speedUnit,
    required this.speedUnitString,
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
                DateFormat('MMM, d', locale).format(date),
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
                  itemCount: hourlyForecasts.length,
                  itemExtent: ScreenUtil().setWidth(80),
                  itemBuilder: (context, index) {
                    return buildCardWeather(
                      '${getTemp(hourlyForecasts[index].temperature, temperatureUnit).toStringAsFixed(0)}\u00b0',
                      'assets/images/weather_state/${hourlyForecasts[index].weather.icon}.png',
                      getSpeed(hourlyForecasts[index].windSpd, speedUnit),
                      speedUnitString,
                      DateFormat('HH:mm').format(hourlyForecasts[index].time),
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
