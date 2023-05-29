import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/setting/setting_view_model.dart';

import '../../../../di/dependency_injection.dart';
import 'setting_state.dart';

final settingViewModelProvider =
    StateNotifierProvider<SettingViewModel, SettingState>((ref) {
  return SettingViewModel(ref, getIt<SharedPreferencesHelper>());
});

class SettingScreen extends ConsumerWidget {
  static const routeName = '/setting';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Setting',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Unit'),
              buildUnitListTile(
                'Temperature',
                ['\u00b0C', '\u00b0F', '\u00b0K'],
                ref.watch(settingViewModelProvider).temperatureUnitString,
                ref
                    .read(settingViewModelProvider.notifier)
                    .onTemperatureUnitChanged,
              ),
              buildUnitListTile(
                'Wind Speed',
                ['m/s', 'km/h', 'mph'],
                ref.watch(settingViewModelProvider).speedUnitString,
                ref.read(settingViewModelProvider.notifier).onSpeedUnitChanged,
              ),
              buildUnitListTile(
                'Pressure',
                ['mb', 'hPa', 'mmHg'],
                ref.watch(settingViewModelProvider).pressureUnitString,
                ref
                    .read(settingViewModelProvider.notifier)
                    .onPressureUnitChanged,
              ),
            ],
          ),
        ));
  }

  ListTile buildUnitListTile(
    String title,
    List<String> values,
    String currentValue,
    void Function(String) onChanged,
  ) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
      trailing: DropdownButton<String>(
        value: currentValue,
        borderRadius: BorderRadius.circular(10),
        onChanged: (String? newValue) {
          onChanged(newValue!);
        },
        items: values.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                )),
          );
        }).toList(),
      ),
    );
  }
}
