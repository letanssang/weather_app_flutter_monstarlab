// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aqi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AQIState {
  FetchingState get fetchingState => throw _privateConstructorUsedError;
  AQI get currentAQI => throw _privateConstructorUsedError;
  List<HourlyAQI> get hourlyAQIs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AQIStateCopyWith<AQIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AQIStateCopyWith<$Res> {
  factory $AQIStateCopyWith(AQIState value, $Res Function(AQIState) then) =
      _$AQIStateCopyWithImpl<$Res, AQIState>;
  @useResult
  $Res call(
      {FetchingState fetchingState,
      AQI currentAQI,
      List<HourlyAQI> hourlyAQIs});
}

/// @nodoc
class _$AQIStateCopyWithImpl<$Res, $Val extends AQIState>
    implements $AQIStateCopyWith<$Res> {
  _$AQIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchingState = null,
    Object? currentAQI = null,
    Object? hourlyAQIs = null,
  }) {
    return _then(_value.copyWith(
      fetchingState: null == fetchingState
          ? _value.fetchingState
          : fetchingState // ignore: cast_nullable_to_non_nullable
              as FetchingState,
      currentAQI: null == currentAQI
          ? _value.currentAQI
          : currentAQI // ignore: cast_nullable_to_non_nullable
              as AQI,
      hourlyAQIs: null == hourlyAQIs
          ? _value.hourlyAQIs
          : hourlyAQIs // ignore: cast_nullable_to_non_nullable
              as List<HourlyAQI>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AQIStateCopyWith<$Res> implements $AQIStateCopyWith<$Res> {
  factory _$$_AQIStateCopyWith(
          _$_AQIState value, $Res Function(_$_AQIState) then) =
      __$$_AQIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchingState fetchingState,
      AQI currentAQI,
      List<HourlyAQI> hourlyAQIs});
}

/// @nodoc
class __$$_AQIStateCopyWithImpl<$Res>
    extends _$AQIStateCopyWithImpl<$Res, _$_AQIState>
    implements _$$_AQIStateCopyWith<$Res> {
  __$$_AQIStateCopyWithImpl(
      _$_AQIState _value, $Res Function(_$_AQIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchingState = null,
    Object? currentAQI = null,
    Object? hourlyAQIs = null,
  }) {
    return _then(_$_AQIState(
      fetchingState: null == fetchingState
          ? _value.fetchingState
          : fetchingState // ignore: cast_nullable_to_non_nullable
              as FetchingState,
      currentAQI: null == currentAQI
          ? _value.currentAQI
          : currentAQI // ignore: cast_nullable_to_non_nullable
              as AQI,
      hourlyAQIs: null == hourlyAQIs
          ? _value._hourlyAQIs
          : hourlyAQIs // ignore: cast_nullable_to_non_nullable
              as List<HourlyAQI>,
    ));
  }
}

/// @nodoc

class _$_AQIState implements _AQIState {
  const _$_AQIState(
      {this.fetchingState = FetchingState.init,
      required this.currentAQI,
      required final List<HourlyAQI> hourlyAQIs})
      : _hourlyAQIs = hourlyAQIs;

  @override
  @JsonKey()
  final FetchingState fetchingState;
  @override
  final AQI currentAQI;
  final List<HourlyAQI> _hourlyAQIs;
  @override
  List<HourlyAQI> get hourlyAQIs {
    if (_hourlyAQIs is EqualUnmodifiableListView) return _hourlyAQIs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyAQIs);
  }

  @override
  String toString() {
    return 'AQIState(fetchingState: $fetchingState, currentAQI: $currentAQI, hourlyAQIs: $hourlyAQIs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AQIState &&
            (identical(other.fetchingState, fetchingState) ||
                other.fetchingState == fetchingState) &&
            (identical(other.currentAQI, currentAQI) ||
                other.currentAQI == currentAQI) &&
            const DeepCollectionEquality()
                .equals(other._hourlyAQIs, _hourlyAQIs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchingState, currentAQI,
      const DeepCollectionEquality().hash(_hourlyAQIs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AQIStateCopyWith<_$_AQIState> get copyWith =>
      __$$_AQIStateCopyWithImpl<_$_AQIState>(this, _$identity);
}

abstract class _AQIState implements AQIState {
  const factory _AQIState(
      {final FetchingState fetchingState,
      required final AQI currentAQI,
      required final List<HourlyAQI> hourlyAQIs}) = _$_AQIState;

  @override
  FetchingState get fetchingState;
  @override
  AQI get currentAQI;
  @override
  List<HourlyAQI> get hourlyAQIs;
  @override
  @JsonKey(ignore: true)
  _$$_AQIStateCopyWith<_$_AQIState> get copyWith =>
      throw _privateConstructorUsedError;
}
