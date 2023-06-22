import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/daily_forecast.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_state.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/get_weather_description_locale.dart';

import '../../../../utils/functions/convert_unit.dart';

class DailyForecastScreen extends ConsumerWidget {
  static const routeName = '/daily-forecast';

  const DailyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyForecasts =
        ModalRoute.of(context)!.settings.arguments as List<DailyForecast>;
    final settingState = ref.watch(settingViewModelProvider);
    String locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: ScreenUtil().setHeight(25),
            )),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
              child: Text(
                AppLocalizations.of(context)!.weekForecast,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemExtent: ScreenUtil().setWidth(150),
                  scrollDirection: Axis.horizontal,
                  itemCount: dailyForecasts.length,
                  itemBuilder: (context, index) {
                    final dailyForecast = dailyForecasts[index];
                    return buildDailyForecastListViewItem(
                        index, context, locale, dailyForecast, settingState);
                  }),
            ),
            Flexible(child: Container()),
          ],
        ),
      ),
    );
  }

  Container buildDailyForecastListViewItem(int index, BuildContext context,
      String locale, DailyForecast dailyForecast, SettingState settingState) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            index == 0
                ? AppLocalizations.of(context)!.today
                : index == 1
                    ? AppLocalizations.of(context)!.tomorrow
                    : DateFormat.E(locale).format(dailyForecast.date),
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.black87,
            ),
          ),
          Text(
            DateFormat.Md().format(dailyForecast.date),
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20), color: Colors.black45),
          ),
          Image.asset(
            'assets/images/weather_state/${dailyForecast.weather.icon}.png',
            width: ScreenUtil().setHeight(40),
            height: ScreenUtil().setHeight(40),
          ),
          Text(
            '${getTemp(dailyForecast.maxTemperature, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnit.toTempString()}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
            ),
          ),
          Text(
            '${getTemp(dailyForecast.minTemperature, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnit.toTempString()}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/icons/wind.svg',
                width: ScreenUtil().setHeight(20),
                height: ScreenUtil().setHeight(20),
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              Text(
                '${getSpeed(dailyForecast.windSpd, settingState.speedUnit).toStringAsFixed(0)} ${settingState.speedUnit.toSpeedString()}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
            ],
          ),
          Text(
            getWeatherDescriptionLocale(dailyForecast.weather.code, context),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
        ],
      ),
    );
  }
}
