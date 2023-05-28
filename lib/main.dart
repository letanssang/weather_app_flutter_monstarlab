import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/aqi/aqi_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/daily_forecast/daily_forecast_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';

import 'di/dependency_injection.dart';
import 'presentation/views/screens/city_manager/city_manager_screen.dart';
import 'presentation/views/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
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
      routes: {
        DailyForecastScreen.routeName: (context) => const DailyForecastScreen(),
        CityManagerScreen.routeName: (context) => const CityManagerScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        SettingScreen.routeName: (context) => const SettingScreen(),
        AQIScreen.routeName: (context) => const AQIScreen(),
      },
    );
  }
}
