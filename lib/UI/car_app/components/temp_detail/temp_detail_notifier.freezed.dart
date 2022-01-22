// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temp_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TempDetailStateTearOff {
  const _$TempDetailStateTearOff();

  _TempDetailState call({int temp = 29}) {
    return _TempDetailState(
      temp: temp,
    );
  }
}

/// @nodoc
const $TempDetailState = _$TempDetailStateTearOff();

/// @nodoc
mixin _$TempDetailState {
  /// Main Count
  int get temp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempDetailStateCopyWith<TempDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempDetailStateCopyWith<$Res> {
  factory $TempDetailStateCopyWith(
          TempDetailState value, $Res Function(TempDetailState) then) =
      _$TempDetailStateCopyWithImpl<$Res>;
  $Res call({int temp});
}

/// @nodoc
class _$TempDetailStateCopyWithImpl<$Res>
    implements $TempDetailStateCopyWith<$Res> {
  _$TempDetailStateCopyWithImpl(this._value, this._then);

  final TempDetailState _value;
  // ignore: unused_field
  final $Res Function(TempDetailState) _then;

  @override
  $Res call({
    Object? temp = freezed,
  }) {
    return _then(_value.copyWith(
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TempDetailStateCopyWith<$Res>
    implements $TempDetailStateCopyWith<$Res> {
  factory _$TempDetailStateCopyWith(
          _TempDetailState value, $Res Function(_TempDetailState) then) =
      __$TempDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({int temp});
}

/// @nodoc
class __$TempDetailStateCopyWithImpl<$Res>
    extends _$TempDetailStateCopyWithImpl<$Res>
    implements _$TempDetailStateCopyWith<$Res> {
  __$TempDetailStateCopyWithImpl(
      _TempDetailState _value, $Res Function(_TempDetailState) _then)
      : super(_value, (v) => _then(v as _TempDetailState));

  @override
  _TempDetailState get _value => super._value as _TempDetailState;

  @override
  $Res call({
    Object? temp = freezed,
  }) {
    return _then(_TempDetailState(
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TempDetailState implements _TempDetailState {
  const _$_TempDetailState({this.temp = 29});

  @JsonKey()
  @override

  /// Main Count
  final int temp;

  @override
  String toString() {
    return 'TempDetailState(temp: $temp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TempDetailState &&
            const DeepCollectionEquality().equals(other.temp, temp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(temp));

  @JsonKey(ignore: true)
  @override
  _$TempDetailStateCopyWith<_TempDetailState> get copyWith =>
      __$TempDetailStateCopyWithImpl<_TempDetailState>(this, _$identity);
}

abstract class _TempDetailState implements TempDetailState {
  const factory _TempDetailState({int temp}) = _$_TempDetailState;

  @override

  /// Main Count
  int get temp;
  @override
  @JsonKey(ignore: true)
  _$TempDetailStateCopyWith<_TempDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
