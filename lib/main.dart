import 'package:flutter/material.dart';
import 'package:weather_app_flutter_monstarlab/domain/use_cases/get_current_weather_from_coordinate_use_case.dart';

import 'di/dependency_injection.dart';
import 'presentation/views/screens/home/home_screen.dart';

void main() async {
  setupDependencies();
  final test = await getIt<GetCurrentWeatherFromCoordinateUseCase>()
      .run(lat: 10.762622, lon: 106.660172, lang: 'vi', units: 'metric');
  print(test);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
