import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/measurement_type.dart';

import '../../domain/entities/level.dart';

Map<MeasurementType, Level> levels = {
  MeasurementType.aqi:
      Level(lowest: 50, low: 100, medium: 150, high: 200, highest: 300),
  MeasurementType.pm25:
      Level(lowest: 12, low: 35.4, medium: 55.4, high: 150.4, highest: 250.4),
  MeasurementType.pm10:
      Level(lowest: 54, low: 154, medium: 254, high: 354, highest: 424),
  MeasurementType.o3:
      Level(lowest: 54, low: 70, medium: 85, high: 105, highest: 200),
  MeasurementType.no2:
      Level(lowest: 53, low: 100, medium: 360, high: 649, highest: 1249),
  MeasurementType.so2:
      Level(lowest: 35, low: 75, medium: 185, high: 304, highest: 604),
  MeasurementType.co:
      Level(lowest: 4.4, low: 9.4, medium: 12.4, high: 15.4, highest: 30.4),
};
Color getColorLevel(MeasurementType type, double value) {
  final level = levels[type];
  if (value <= level!.lowest) {
    return const Color(0xFF236B23);
  } else if (value <= level.low) {
    return const Color(0xFF9D8317);
  } else if (value <= level.medium) {
    return const Color(0xFFFF7E00);
  } else if (value <= level.high) {
    return const Color(0xFFCC0033);
  } else {
    return const Color(0xFF660099);
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
