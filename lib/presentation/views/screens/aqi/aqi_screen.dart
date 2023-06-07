import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: ScreenUtil().setHeight(25),
            )),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
        child: state.fetchingState == FetchingState.success
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.airQualityIndex,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(30),
                                fontWeight: FontWeight.w700,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(cityName,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: ScreenUtil().setSp(30),
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          Row(
                            children: [
                              Text(state.currentAQI.aqi.toStringAsFixed(0),
                                  style: TextStyle(
                                    color: getColorLevel(
                                        'aqi', state.currentAQI.aqi.toDouble()),
                                    fontSize: ScreenUtil().setSp(75),
                                    fontWeight: FontWeight.w700,
                                  )),
                              SizedBox(width: ScreenUtil().setHeight(8)),
                              Text(
                                getAQIStatus(state.currentAQI.aqi, context),
                                maxLines: 2,
                                style: TextStyle(
                                  color: getColorLevel(
                                      'aqi', state.currentAQI.aqi.toDouble()),
                                  fontSize: ScreenUtil().setSp(20),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                getAQIDescription(
                                    state.currentAQI.aqi, context),
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: ScreenUtil().setSp(18),
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          SizedBox(
                            height: ScreenUtil().screenHeight * 0.2,
                            child: GridView(
                              padding:
                                  EdgeInsets.all(ScreenUtil().setHeight(8)),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.5,
                              ),
                              shrinkWrap: true,
                              children: [
                                buildDetailAQIIndex(
                                    state.currentAQI.pm25,
                                    'PM2.5',
                                    getColorLevel(
                                        'pm25', state.currentAQI.pm25)),
                                buildDetailAQIIndex(
                                  state.currentAQI.pm10,
                                  'PM10',
                                  getColorLevel('pm10', state.currentAQI.pm10),
                                ),
                                buildDetailAQIIndex(
                                    state.currentAQI.so2,
                                    'SO\u2082',
                                    getColorLevel('so2', state.currentAQI.so2)),
                                buildDetailAQIIndex(
                                    state.currentAQI.no2,
                                    'NO\u2082',
                                    getColorLevel('no2', state.currentAQI.no2)),
                                buildDetailAQIIndex(
                                    state.currentAQI.o3,
                                    'O\u2083',
                                    getColorLevel('o3', state.currentAQI.o3)),
                                buildDetailAQIIndex(state.currentAQI.co, 'CO',
                                    getColorLevel('co', state.currentAQI.co)),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(16)),
                    child: Text(AppLocalizations.of(context)!.hourlyAQIForecast,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.hourlyAQIs.length,
                      itemExtent: ScreenUtil().setWidth(60),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(state.hourlyAQIs[index].aqi.toStringAsFixed(0),
                              style: TextStyle(
                                color: getColorLevel('aqi',
                                    state.hourlyAQIs[index].aqi.toDouble()),
                                fontSize: ScreenUtil().setSp(22),
                              )),
                          const SizedBox(height: 8),
                          Text(
                              '${DateFormat.H().format(state.hourlyAQIs[index].timestamp!)}:00',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(16),
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

  Column buildDetailAQIIndex(double value, String title, Color color) {
    return Column(
      children: [
        Text(value.toStringAsFixed(1),
            style: TextStyle(
              color: color,
              fontSize: ScreenUtil().setSp(22),
            )),
        Text(title,
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(16),
            )),
      ],
    );
  }
}
