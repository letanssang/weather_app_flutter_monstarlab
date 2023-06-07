import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/daily_forecast/daily_forecast_screen.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/get_weather_description_locale.dart';

import '../../../../../domain/entities/daily_forecast.dart';
import '../../../widgets/custom_container.dart';

class DailyContainer extends StatelessWidget {
  final List<DailyForecast> dailyForecasts;
  final Color? color;
  final Color buttonColor;
  final TemperatureUnit temperatureUnit;
  const DailyContainer(
      {super.key,
      required this.dailyForecasts,
      this.color,
      required this.buttonColor,
      required this.temperatureUnit});

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    return CustomContainer(
      color: color,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.005),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.nextForecast,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        DailyForecastScreen.routeName,
                        arguments: dailyForecasts);
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: ScreenUtil().setHeight(20),
                  )),
            ],
          ),
          for (int i = 1; i < 4; i++)
            buildNextForecastItem(
              i == 1
                  ? AppLocalizations.of(context)!.tomorrow
                  : DateFormat('EEEE', locale).format(dailyForecasts[i].date),
              dailyForecasts[i].weather.icon,
              getWeatherDescriptionLocale(
                  dailyForecasts[i].weather.code, context),
              getTemp(dailyForecasts[i].maxTemperature, temperatureUnit),
              getTemp(dailyForecasts[i].minTemperature, temperatureUnit),
            ),
          ActionChip(
              elevation: 3,
              backgroundColor: buttonColor,
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16),
                  vertical: ScreenUtil().setHeight(10)),
              label: Text(
                AppLocalizations.of(context)!.weekForecast,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(DailyForecastScreen.routeName,
                    arguments: dailyForecasts);
              }),
        ],
      ),
    );
  }

  Padding buildNextForecastItem(String date, String icon, String description,
      double maxTemp, double minTemp) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(16),
          horizontal: ScreenUtil().setWidth(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Image.asset('assets/images/weather_state/$icon.png',
                    width: ScreenUtil().setWidth(20),
                    height: ScreenUtil().setHeight(20)),
                SizedBox(width: ScreenUtil().setWidth(5)),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              description.length < 15 ? description : description.split(' ')[0],
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              '${maxTemp.toStringAsFixed(0)}\u00b0 / ${minTemp.toStringAsFixed(0)}\u00b0',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
