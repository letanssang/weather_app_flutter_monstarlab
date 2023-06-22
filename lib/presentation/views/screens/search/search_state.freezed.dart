// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  Timer? get searchOnStoppedTyping => throw _privateConstructorUsedError;
  FetchingState get fetchingState => throw _privateConstructorUsedError;
  List<City> get suggestions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {Timer? searchOnStoppedTyping,
      FetchingState fetchingState,
      List<City> suggestions});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchOnStoppedTyping = freezed,
    Object? fetchingState = null,
    Object? suggestions = null,
  }) {
    return _then(_value.copyWith(
      searchOnStoppedTyping: freezed == searchOnStoppedTyping
          ? _value.searchOnStoppedTyping
          : searchOnStoppedTyping // ignore: cast_nullable_to_non_nullable
              as Timer?,
      fetchingState: null == fetchingState
          ? _value.fetchingState
          : fetchingState // ignore: cast_nullable_to_non_nullable
              as FetchingState,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Timer? searchOnStoppedTyping,
      FetchingState fetchingState,
      List<City> suggestions});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchOnStoppedTyping = freezed,
    Object? fetchingState = null,
    Object? suggestions = null,
  }) {
    return _then(_$_SearchState(
      searchOnStoppedTyping: freezed == searchOnStoppedTyping
          ? _value.searchOnStoppedTyping
          : searchOnStoppedTyping // ignore: cast_nullable_to_non_nullable
              as Timer?,
      fetchingState: null == fetchingState
          ? _value.fetchingState
          : fetchingState // ignore: cast_nullable_to_non_nullable
              as FetchingState,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.searchOnStoppedTyping,
      this.fetchingState = FetchingState.init,
      final List<City> suggestions = const []})
      : _suggestions = suggestions;

  @override
  final Timer? searchOnStoppedTyping;
  @override
  @JsonKey()
  final FetchingState fetchingState;
  final List<City> _suggestions;
  @override
  @JsonKey()
  List<City> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  String toString() {
    return 'SearchState(searchOnStoppedTyping: $searchOnStoppedTyping, fetchingState: $fetchingState, suggestions: $suggestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.searchOnStoppedTyping, searchOnStoppedTyping) ||
                other.searchOnStoppedTyping == searchOnStoppedTyping) &&
            (identical(other.fetchingState, fetchingState) ||
                other.fetchingState == fetchingState) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchOnStoppedTyping,
      fetchingState, const DeepCollectionEquality().hash(_suggestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final Timer? searchOnStoppedTyping,
      final FetchingState fetchingState,
      final List<City> suggestions}) = _$_SearchState;

  @override
  Timer? get searchOnStoppedTyping;
  @override
  FetchingState get fetchingState;
  @override
  List<City> get suggestions;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
