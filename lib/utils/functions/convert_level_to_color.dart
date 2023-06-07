import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Map<String, List> level = {
  'aqi': [50, 100, 150, 200, 300],
  'pm25': [12, 35.4, 55.4, 150.4, 250.4],
  'pm10': [54, 154, 254, 354, 424],
  'o3': [54, 70, 85, 105, 200],
  'no2': [53, 100, 360, 649, 1249],
  'so2': [35, 75, 185, 304, 604],
  'co': [4.4, 9.4, 12.4, 15.4, 30.4],
};
Color getColorLevel(String type, double value) {
  if (value <= level[type]![0]) {
    return const Color(0xFF236B23);
  } else if (value <= level[type]![1]) {
    return const Color(0xFF9D8317);
  } else if (value <= level[type]![2]) {
    return const Color(0xFFFF7E00);
  } else if (value <= level[type]![3]) {
    return const Color(0xFFCC0033);
  } else if (value <= level[type]![4]) {
    return const Color(0xFF660099);
  } else {
    return const Color(0xFF7E0023);
  }
}

String getAQIStatus(int aqi, BuildContext context) {
  if (aqi <= 50) {
    return AppLocalizations.of(context)!.good;
  } else if (aqi <= 100) {
    return AppLocalizations.of(context)!.moderate;
  } else if (aqi <= 200) {
    return AppLocalizations.of(context)!.unhealthy;
  } else if (aqi <= 300) {
    return AppLocalizations.of(context)!.veryUnhealthy;
  } else {
    return AppLocalizations.of(context)!.hazardous;
  }
}

String getAQIDescription(int aqi, BuildContext context) {
  if (aqi <= 50) {
    return AppLocalizations.of(context)!.goodDescription;
  } else if (aqi <= 100) {
    return AppLocalizations.of(context)!.moderateDescription;
  } else if (aqi <= 200) {
    return AppLocalizations.of(context)!.unhealthyDescription;
  } else if (aqi <= 300) {
    return AppLocalizations.of(context)!.veryUnhealthyDescription;
  } else {
    return AppLocalizations.of(context)!.hazardousDescription;
  }
}
