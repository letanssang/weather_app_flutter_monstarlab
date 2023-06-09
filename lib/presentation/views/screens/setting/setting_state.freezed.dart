// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingState {
  TemperatureUnit get temperatureUnit => throw _privateConstructorUsedError;
  PressureUnit get pressureUnit => throw _privateConstructorUsedError;
  SpeedUnit get speedUnit => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;
  Language get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call(
      {TemperatureUnit temperatureUnit,
      PressureUnit pressureUnit,
      SpeedUnit speedUnit,
      Locale locale,
      Language language});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperatureUnit = null,
    Object? pressureUnit = null,
    Object? speedUnit = null,
    Object? locale = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      temperatureUnit: null == temperatureUnit
          ? _value.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as TemperatureUnit,
      pressureUnit: null == pressureUnit
          ? _value.pressureUnit
          : pressureUnit // ignore: cast_nullable_to_non_nullable
              as PressureUnit,
      speedUnit: null == speedUnit
          ? _value.speedUnit
          : speedUnit // ignore: cast_nullable_to_non_nullable
              as SpeedUnit,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$_SettingStateCopyWith(
          _$_SettingState value, $Res Function(_$_SettingState) then) =
      __$$_SettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TemperatureUnit temperatureUnit,
      PressureUnit pressureUnit,
      SpeedUnit speedUnit,
      Locale locale,
      Language language});
}

/// @nodoc
class __$$_SettingStateCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$_SettingState>
    implements _$$_SettingStateCopyWith<$Res> {
  __$$_SettingStateCopyWithImpl(
      _$_SettingState _value, $Res Function(_$_SettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperatureUnit = null,
    Object? pressureUnit = null,
    Object? speedUnit = null,
    Object? locale = null,
    Object? language = null,
  }) {
    return _then(_$_SettingState(
      temperatureUnit: null == temperatureUnit
          ? _value.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as TemperatureUnit,
      pressureUnit: null == pressureUnit
          ? _value.pressureUnit
          : pressureUnit // ignore: cast_nullable_to_non_nullable
              as PressureUnit,
      speedUnit: null == speedUnit
          ? _value.speedUnit
          : speedUnit // ignore: cast_nullable_to_non_nullable
              as SpeedUnit,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }
}

/// @nodoc

class _$_SettingState implements _SettingState {
  const _$_SettingState(
      {this.temperatureUnit = TemperatureUnit.celsius,
      this.pressureUnit = PressureUnit.milliBar,
      this.speedUnit = SpeedUnit.metersPerSecond,
      this.locale = const Locale('en', 'US'),
      this.language = Language.english});

  @override
  @JsonKey()
  final TemperatureUnit temperatureUnit;
  @override
  @JsonKey()
  final PressureUnit pressureUnit;
  @override
  @JsonKey()
  final SpeedUnit speedUnit;
  @override
  @JsonKey()
  final Locale locale;
  @override
  @JsonKey()
  final Language language;

  @override
  String toString() {
    return 'SettingState(temperatureUnit: $temperatureUnit, pressureUnit: $pressureUnit, speedUnit: $speedUnit, locale: $locale, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingState &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                other.temperatureUnit == temperatureUnit) &&
            (identical(other.pressureUnit, pressureUnit) ||
                other.pressureUnit == pressureUnit) &&
            (identical(other.speedUnit, speedUnit) ||
                other.speedUnit == speedUnit) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, temperatureUnit, pressureUnit, speedUnit, locale, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      __$$_SettingStateCopyWithImpl<_$_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {final TemperatureUnit temperatureUnit,
      final PressureUnit pressureUnit,
      final SpeedUnit speedUnit,
      final Locale locale,
      final Language language}) = _$_SettingState;

  @override
  TemperatureUnit get temperatureUnit;
  @override
  PressureUnit get pressureUnit;
  @override
  SpeedUnit get speedUnit;
  @override
  Locale get locale;
  @override
  Language get language;
  @override
  @JsonKey(ignore: true)
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
