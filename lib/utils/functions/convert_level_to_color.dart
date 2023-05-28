import 'dart:ui';

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

String getAQIStatus(int aqi) {
  if (aqi <= 50) {
    return 'Good';
  } else if (aqi <= 100) {
    return 'Moderate';
  } else if (aqi <= 150) {
    return 'Unhealthy for Sensitive Groups';
  } else if (aqi <= 200) {
    return 'Unhealthy';
  } else if (aqi <= 300) {
    return 'Very Unhealthy';
  } else {
    return 'Hazardous';
  }
}

String getAQIDescription(int aqi) {
  if (aqi <= 50) {
    return 'Air quality is good. A perfect day for a walk!';
  } else if (aqi <= 100) {
    return 'Air quality is moderate. You can go out for a walk!';
  } else if (aqi <= 150) {
    return 'Air quality is unhealthy for sensitive groups. You should wear a mask when going out!';
  } else if (aqi <= 200) {
    return 'Air quality is unhealthy. You should wear a mask when going out!';
  } else if (aqi <= 300) {
    return 'Air quality is very unhealthy. You should wear a mask when going out!';
  } else {
    return 'Air quality is hazardous. You should stay at home!';
  }
}
