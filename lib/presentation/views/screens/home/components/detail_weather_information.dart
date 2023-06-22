import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../../../domain/entities/weather.dart';
import '../../../widgets/custom_container.dart';
import '../../setting/setting_state.dart';

class DetailWeatherInformation extends StatelessWidget {
  final Weather weather;
  final Color? color;
  final SettingState settingState;
  const DetailWeatherInformation(
      {Key? key, required this.weather, required this.settingState, this.color})
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
            '${weather.hourlyForecasts.first.pop}%',
          ),
          buildWeatherInfoItem(
            'assets/images/icons/humidity.svg',
            '${weather.humidity}%',
          ),
          buildWeatherInfoItem(
            'assets/images/icons/wind.svg',
            '${getSpeed(weather.windSpd, settingState.speedUnit).toStringAsFixed(1)} ${settingState.speedUnit.toSpeedString()}',
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
