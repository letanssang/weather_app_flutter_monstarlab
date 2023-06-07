import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_state.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../../../domain/entities/weather.dart';
import '../../../widgets/custom_container.dart';

class MoreWeatherInformation extends StatelessWidget {
  const MoreWeatherInformation(
      {super.key,
      required this.weather,
      this.color,
      required this.settingState});

  final Weather weather;
  final Color? color;
  final SettingState settingState;

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
                  color: color,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005,
                    right: MediaQuery.of(context).size.width * 0.005,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.feelsLike,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${getTemp(weather.feelLike, settingState.temperatureUnit).toStringAsFixed(0)} ${settingState.temperatureUnitString}',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(22),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: CustomContainer(
                    color: color,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.005,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(weather.sunrise,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              Text(AppLocalizations.of(context)!.sunrise,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    color: Colors.white70,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(weather.sunset,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              Text(AppLocalizations.of(context)!.sunset,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    color: Colors.white70,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        )),
        Expanded(
          child: CustomContainer(
            padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.005,
              left: MediaQuery.of(context).size.width * 0.005,
            ),
            color: color,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowDetailInformation(
                    AppLocalizations.of(context)!.visibility,
                    weather.visibility.toString(),
                    'km'),
                buildRowDetailInformation(
                    'UV', weather.uv.toStringAsFixed(0), ''),
                buildRowDetailInformation(
                    AppLocalizations.of(context)!.pressure,
                    getPressure(weather.pressure, settingState.pressureUnit)
                        .toStringAsFixed(0),
                    settingState.pressureUnitString),
                buildRowDetailInformation(
                    AppLocalizations.of(context)!.cloudCover,
                    weather.clouds.toStringAsFixed(0),
                    '%'),
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
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: ScreenUtil().setSp(14),
                )),
            Text('$value $unit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(14),
                )),
          ],
        ),
        const Divider(
          color: Colors.white70,
          thickness: 1,
        ),
      ],
    );
