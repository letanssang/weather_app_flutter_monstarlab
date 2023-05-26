import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/home/home_screen.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_screen.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/colors.dart';

import 'components/city_weather_card.dart';

class CityManagerScreen extends ConsumerWidget {
  static const routeName = '/city-manager';

  const CityManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(baseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage cities',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
              child: Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.search),
                    ),
                    Text(
                      'Enter location',
                      style: TextStyle(
                        color: Color(0xFF333333),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReorderableListView.builder(
                padding: const EdgeInsets.only(top: 10),
                onReorder: (oldIndex, newIndex) {
                  ref
                      .read(baseViewModelProvider.notifier)
                      .reorderCity(oldIndex, newIndex);
                },
                itemCount: state.citiesWeather.length,
                itemBuilder: (context, index) {
                  return CityWeatherCard(
                      key: UniqueKey(),
                      cityName: state.citiesWeather[index].cityName,
                      aqi: state.citiesWeather[index].aqi,
                      description:
                          state.citiesWeather[index].weather.description,
                      temperature: state.citiesWeather[index].temperature,
                      colorStart: weatherColors[
                              state.citiesWeather[index].weather.code ~/ 100]
                          .startColor,
                      colorMid: weatherColors[
                              state.citiesWeather[index].weather.code ~/ 100]
                          .midColor,
                      colorEnd: weatherColors[
                              state.citiesWeather[index].weather.code ~/ 100]
                          .endColor);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
