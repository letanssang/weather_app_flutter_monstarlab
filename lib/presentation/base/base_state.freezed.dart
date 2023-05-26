// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState {
  WeatherUnits get units => throw _privateConstructorUsedError;
  double get currentLatitude => throw _privateConstructorUsedError;
  double get currentLongitude => throw _privateConstructorUsedError;
  List<City> get cities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseStateCopyWith<BaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<$Res> {
  factory $BaseStateCopyWith(BaseState value, $Res Function(BaseState) then) =
      _$BaseStateCopyWithImpl<$Res, BaseState>;
  @useResult
  $Res call(
      {WeatherUnits units,
      double currentLatitude,
      double currentLongitude,
      List<City> cities});
}

/// @nodoc
class _$BaseStateCopyWithImpl<$Res, $Val extends BaseState>
    implements $BaseStateCopyWith<$Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
    Object? currentLatitude = null,
    Object? currentLongitude = null,
    Object? cities = null,
  }) {
    return _then(_value.copyWith(
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
      currentLatitude: null == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLongitude: null == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseStateCopyWith<$Res> implements $BaseStateCopyWith<$Res> {
  factory _$$_BaseStateCopyWith(
          _$_BaseState value, $Res Function(_$_BaseState) then) =
      __$$_BaseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherUnits units,
      double currentLatitude,
      double currentLongitude,
      List<City> cities});
}

/// @nodoc
class __$$_BaseStateCopyWithImpl<$Res>
    extends _$BaseStateCopyWithImpl<$Res, _$_BaseState>
    implements _$$_BaseStateCopyWith<$Res> {
  __$$_BaseStateCopyWithImpl(
      _$_BaseState _value, $Res Function(_$_BaseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
    Object? currentLatitude = null,
    Object? currentLongitude = null,
    Object? cities = null,
  }) {
    return _then(_$_BaseState(
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
      currentLatitude: null == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLongitude: null == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc

class _$_BaseState implements _BaseState {
  const _$_BaseState(
      {this.units = WeatherUnits.metric,
      this.currentLatitude = 0,
      this.currentLongitude = 0,
      final List<City> cities = const []})
      : _cities = cities;

  @override
  @JsonKey()
  final WeatherUnits units;
  @override
  @JsonKey()
  final double currentLatitude;
  @override
  @JsonKey()
  final double currentLongitude;
  final List<City> _cities;
  @override
  @JsonKey()
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'BaseState(units: $units, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, cities: $cities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseState &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.currentLatitude, currentLatitude) ||
                other.currentLatitude == currentLatitude) &&
            (identical(other.currentLongitude, currentLongitude) ||
                other.currentLongitude == currentLongitude) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, units, currentLatitude,
      currentLongitude, const DeepCollectionEquality().hash(_cities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateCopyWith<_$_BaseState> get copyWith =>
      __$$_BaseStateCopyWithImpl<_$_BaseState>(this, _$identity);
}

abstract class _BaseState implements BaseState {
  const factory _BaseState(
      {final WeatherUnits units,
      final double currentLatitude,
      final double currentLongitude,
      final List<City> cities}) = _$_BaseState;

  @override
  WeatherUnits get units;
  @override
  double get currentLatitude;
  @override
  double get currentLongitude;
  @override
  List<City> get cities;
  @override
  @JsonKey(ignore: true)
  _$$_BaseStateCopyWith<_$_BaseState> get copyWith =>
      throw _privateConstructorUsedError;
}
