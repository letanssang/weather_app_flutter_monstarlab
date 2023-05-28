import 'package:flutter/material.dart';

import '../../domain/entities/weather_color.dart';

const List<WeatherColor> weatherColors = [
  //0
  WeatherColor(
    Color(0xFF08244F),
    Color(0xFF134CB5),
    Color(0xFF0B42AB),
    Color(0xFF0D3673),
  ),
  //1
  WeatherColor(Color(0xFF08244F), Color(0xFF134CB5), Color(0xFF0B42AB),
      Color(0xFF0D3673)),
  //2 Thunderstorm
  WeatherColor(
    Color(0xFF54436B),
    Color(0xFF7F6E8C),
    Color(0xFFAA9DB1),
    Color(0xFF473E63),
  ),
  //3 Drizzle
  WeatherColor(
    Color(0xFF92A9B2),
    Color(0xFF6C848D),
    Color(0xFF4C6B77),
    Color(0xFF7B8991),
  ),
  //4 Nothing
  WeatherColor(
    Color(0xFF08244F),
    Color(0xFF134CB5),
    Color(0xFF0B42AB),
    Color(0xFF0D3673),
  ),
  //5 Rain
  WeatherColor(
    Color(0xFF08244F),
    Color(0xFF134CB5),
    Color(0xFF0B42AB),
    Color(0xFF0D3673),
  ),
  //6 Snow, Sleet, Shower
  WeatherColor(
    Color(0xFF92A9B2),
    Color(0xFF6C848D),
    Color(0xFF4C6B77),
    Color(0xFF7B8991),
  ),

  //7 Fog
  WeatherColor(
    Color(0xFF92A9B2),
    Color(0xFF6C848D),
    Color(0xFF4C6B77),
    Color(0xFF7B8991),
  ),
  //8 Clear Sky or Cloud
  WeatherColor(
    Color(0xFF29B2DD),
    Color(0xFF5ACAE8),
    Color(0xFF29B2DD),
    Color(0xFF008AC0),
  ),
  //9 Unknown Precipitation
  WeatherColor(
    Color(0xFF08244F),
    Color(0xFF134CB5),
    Color(0xFF0B42AB),
    Color(0xFF0D3673),
  ),
];
