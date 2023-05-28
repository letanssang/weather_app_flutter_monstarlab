import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter_monstarlab/di/dependency_injection.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';
import 'package:weather_app_flutter_monstarlab/domain/use_cases/get_aqi_data_use_case.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/aqi/aqi_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/aqi/aqi_view_model.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/widgets/custom_loading_indicator.dart';

import '../../../../domain/use_cases/get_hour_aqi_use_case.dart';
import '../../../../utils/functions/convert_level_to_color.dart';

final aqiViewModelProvider =
    StateNotifierProvider.autoDispose<AQIViewModel, AQIState>((ref) =>
        AQIViewModel(getIt<GetAQIDataUseCase>(), getIt<GetHourlyAQIUseCase>()));

class AQIScreen extends ConsumerStatefulWidget {
  static const routeName = '/aqi';

  const AQIScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<AQIScreen> createState() => _AQIScreenState();
}

class _AQIScreenState extends ConsumerState<AQIScreen> {
  late final String cityName;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cityName = ModalRoute.of(context)!.settings.arguments as String;
      await ref.read(aqiViewModelProvider.notifier).fetchDataAQI(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(aqiViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: state.fetchingState == FetchingState.success
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Air Quality Index',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              )),
                          Text('$cityName',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          Row(
                            children: [
                              Text(state.currentAQI.aqi.toStringAsFixed(0),
                                  style: TextStyle(
                                    color: getColorLevel(
                                        'aqi', state.currentAQI.aqi.toDouble()),
                                    fontSize: 75,
                                    fontWeight: FontWeight.w700,
                                  )),
                              const SizedBox(width: 16),
                              Text(
                                getAQIStatus(state.currentAQI.aqi),
                                style: TextStyle(
                                  color: getColorLevel(
                                      'aqi', state.currentAQI.aqi.toDouble()),
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(getAQIDescription(state.currentAQI.aqi),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                        state.currentAQI.pm25
                                            .toStringAsFixed(1),
                                        style: TextStyle(
                                          color: getColorLevel(
                                              'pm25', state.currentAQI.pm25),
                                          fontSize: 22,
                                        )),
                                    const Text('PM2.5',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                        state.currentAQI.pm10
                                            .toStringAsFixed(1),
                                        style: TextStyle(
                                          color: getColorLevel(
                                              'pm10', state.currentAQI.pm10),
                                          fontSize: 22,
                                        )),
                                    const Text('PM10',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                        state.currentAQI.so2.toStringAsFixed(1),
                                        style: TextStyle(
                                          color: getColorLevel(
                                              'so2', state.currentAQI.so2),
                                          fontSize: 22,
                                        )),
                                    const Text('SO\u2082',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                        state.currentAQI.no2.toStringAsFixed(1),
                                        style: TextStyle(
                                          color: getColorLevel(
                                              'no2', state.currentAQI.no2),
                                          fontSize: 22,
                                        )),
                                    const Text('NO\u2082',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(state.currentAQI.o3.toStringAsFixed(1),
                                        style: TextStyle(
                                          color: getColorLevel(
                                              'o3', state.currentAQI.o3),
                                          fontSize: 22,
                                        )),
                                    const Text('O\u2083',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(state.currentAQI.co.toStringAsFixed(0),
                                        style: TextStyle(
                                          color: getColorLevel(
                                              'co', state.currentAQI.co),
                                          fontSize: 22,
                                        )),
                                    const Text('CO',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                              ]),
                          const SizedBox(height: 16),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('Hourly AQI',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.hourlyAQIs.length,
                      itemExtent: 60,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(state.hourlyAQIs[index].aqi.toStringAsFixed(0),
                              style: TextStyle(
                                color: getColorLevel('aqi',
                                    state.hourlyAQIs[index].aqi.toDouble()),
                                fontSize: 22,
                              )),
                          SizedBox(height: 8),
                          Text(
                              '${DateFormat.H().format(state.hourlyAQIs[index].timestamp!)}:00',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : state.fetchingState == FetchingState.loading
                ? const CustomLoadingIndicator()
                : const Center(child: Text('Load AQI data failed')),
      ),
    );
  }
}
