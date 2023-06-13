import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/aqi/aqi_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/daily_forecast/daily_forecast_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_screen.dart';

import 'di/dependency_injection.dart';
import 'firebase_options.dart';
import 'presentation/views/screens/city_manager/city_manager_screen.dart';
import 'presentation/views/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  debugPrint('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification: ${message.notification}');
    }
  });
  setupDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>
            const ProviderScope(child: MyApp()), // Wrap your app
      ),
    );
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(settingViewModelProvider).locale;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        builder: DevicePreview.appBuilder,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        title: 'Weather App',
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          DailyForecastScreen.routeName: (context) =>
              const DailyForecastScreen(),
          CityManagerScreen.routeName: (context) => const CityManagerScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          SettingScreen.routeName: (context) => const SettingScreen(),
          AQIScreen.routeName: (context) => const AQIScreen(),
        },
      ),
    );
  }
}
