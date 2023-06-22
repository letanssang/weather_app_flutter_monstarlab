import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/data/local/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/units.dart';
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
    final state = ref.watch(settingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: ScreenUtil().setHeight(20),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.setting,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(18),
          ),
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
            Text(
              AppLocalizations.of(context)!.units,
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
            _buildDropdownItem<TemperatureUnit>(
              context,
              state.temperatureUnit,
              AppLocalizations.of(context)!.temperature,
              (TemperatureUnit? temperatureUnit) {
                ref
                    .read(settingViewModelProvider.notifier)
                    .onTemperatureUnitChanged(temperatureUnit!);
              },
              TemperatureUnit.values.map<DropdownMenuItem<TemperatureUnit>>(
                (TemperatureUnit value) {
                  return DropdownMenuItem<TemperatureUnit>(
                    value: value,
                    child: Text(value.toTempString()),
                  );
                },
              ).toList(),
            ),
            _buildDropdownItem<SpeedUnit>(
              context,
              state.speedUnit,
              AppLocalizations.of(context)!.windSpeed,
              (SpeedUnit? speedUnit) {
                ref
                    .read(settingViewModelProvider.notifier)
                    .onSpeedUnitChanged(speedUnit!);
              },
              SpeedUnit.values.map<DropdownMenuItem<SpeedUnit>>(
                (SpeedUnit value) {
                  return DropdownMenuItem<SpeedUnit>(
                    value: value,
                    child: Text(value.toSpeedString()),
                  );
                },
              ).toList(),
            ),
            _buildDropdownItem<PressureUnit>(
              context,
              state.pressureUnit,
              AppLocalizations.of(context)!.pressure,
              (PressureUnit? pressureUnit) {
                ref
                    .read(settingViewModelProvider.notifier)
                    .onPressureUnitChanged(pressureUnit!);
              },
              PressureUnit.values.map<DropdownMenuItem<PressureUnit>>(
                (PressureUnit value) {
                  return DropdownMenuItem<PressureUnit>(
                    value: value,
                    child: Text(value.toPressureString()),
                  );
                },
              ).toList(),
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
            _buildDropdownItem<Language>(
              context,
              state.language,
              AppLocalizations.of(context)!.language,
              (Language? language) {
                ref
                    .read(settingViewModelProvider.notifier)
                    .onLanguageChanged(language!);
              },
              Language.values.map<DropdownMenuItem<Language>>(
                (Language value) {
                  return DropdownMenuItem<Language>(
                    value: value,
                    child: Text(value.toLanguageString()),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem<T>(
    BuildContext context,
    T? value,
    String title,
    void Function(T?) onChanged,
    List<DropdownMenuItem<T>> items,
  ) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setSp(8)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: DropdownButton<T>(
          value: value,
          icon: Icon(
            Icons.arrow_drop_down,
            size: ScreenUtil().setHeight(20),
          ),
          itemHeight: kMinInteractiveDimension,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          onChanged: onChanged,
          items: items,
        ),
      ),
    );
  }
}
