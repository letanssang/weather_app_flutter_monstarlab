import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_container.dart';

class AQIContainer extends StatelessWidget {
  const AQIContainer(
      {super.key, required this.aqi, this.color, required this.cityName});

  final int aqi;
  final Color? color;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/aqi', arguments: cityName);
      },
      child: CustomContainer(
        color: color,
        margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(20),
            top: ScreenUtil().screenHeight * 0.005),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.eco, color: Colors.white),
                Text(' AQI $aqi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(18),
                    )),
              ],
            ),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.fullAirQualityForecast,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: ScreenUtil().setSp(14),
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  size: ScreenUtil().setHeight(10),
                  color: Colors.white70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
