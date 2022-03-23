// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'distance_tracker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DistanceTrackerStateTearOff {
  const _$DistanceTrackerStateTearOff();

  _DistanceTrackerState call(
      {required TrackRecordModel? trackRecordModel,
      required bool isSubmitting,
      required bool isSuccess,
      required bool isFailure,
      required String info}) {
    return _DistanceTrackerState(
      trackRecordModel: trackRecordModel,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
      info: info,
    );
  }
}

/// @nodoc
const $DistanceTrackerState = _$DistanceTrackerStateTearOff();

/// @nodoc
mixin _$DistanceTrackerState {
  TrackRecordModel? get trackRecordModel => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DistanceTrackerStateCopyWith<DistanceTrackerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceTrackerStateCopyWith<$Res> {
  factory $DistanceTrackerStateCopyWith(DistanceTrackerState value,
          $Res Function(DistanceTrackerState) then) =
      _$DistanceTrackerStateCopyWithImpl<$Res>;
  $Res call(
      {TrackRecordModel? trackRecordModel,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String info});
}

/// @nodoc
class _$DistanceTrackerStateCopyWithImpl<$Res>
    implements $DistanceTrackerStateCopyWith<$Res> {
  _$DistanceTrackerStateCopyWithImpl(this._value, this._then);

  final DistanceTrackerState _value;
  // ignore: unused_field
  final $Res Function(DistanceTrackerState) _then;

  @override
  $Res call({
    Object? trackRecordModel = freezed,
    Object? isSubmitting = freezed,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      trackRecordModel: trackRecordModel == freezed
          ? _value.trackRecordModel
          : trackRecordModel // ignore: cast_nullable_to_non_nullable
              as TrackRecordModel?,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: isFailure == freezed
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DistanceTrackerStateCopyWith<$Res>
    implements $DistanceTrackerStateCopyWith<$Res> {
  factory _$DistanceTrackerStateCopyWith(_DistanceTrackerState value,
          $Res Function(_DistanceTrackerState) then) =
      __$DistanceTrackerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TrackRecordModel? trackRecordModel,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String info});
}

/// @nodoc
class __$DistanceTrackerStateCopyWithImpl<$Res>
    extends _$DistanceTrackerStateCopyWithImpl<$Res>
    implements _$DistanceTrackerStateCopyWith<$Res> {
  __$DistanceTrackerStateCopyWithImpl(
      _DistanceTrackerState _value, $Res Function(_DistanceTrackerState) _then)
      : super(_value, (v) => _then(v as _DistanceTrackerState));

  @override
  _DistanceTrackerState get _value => super._value as _DistanceTrackerState;

  @override
  $Res call({
    Object? trackRecordModel = freezed,
    Object? isSubmitting = freezed,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? info = freezed,
  }) {
    return _then(_DistanceTrackerState(
      trackRecordModel: trackRecordModel == freezed
          ? _value.trackRecordModel
          : trackRecordModel // ignore: cast_nullable_to_non_nullable
              as TrackRecordModel?,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: isFailure == freezed
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DistanceTrackerState extends _DistanceTrackerState {
  const _$_DistanceTrackerState(
      {required this.trackRecordModel,
      required this.isSubmitting,
      required this.isSuccess,
      required this.isFailure,
      required this.info})
      : super._();

  @override
  final TrackRecordModel? trackRecordModel;
  @override
  final bool isSubmitting;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final String info;

  @override
  String toString() {
    return 'DistanceTrackerState(trackRecordModel: $trackRecordModel, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DistanceTrackerState &&
            const DeepCollectionEquality()
                .equals(other.trackRecordModel, trackRecordModel) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.isFailure, isFailure) &&
            const DeepCollectionEquality().equals(other.info, info));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(trackRecordModel),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(isFailure),
      const DeepCollectionEquality().hash(info));

  @JsonKey(ignore: true)
  @override
  _$DistanceTrackerStateCopyWith<_DistanceTrackerState> get copyWith =>
      __$DistanceTrackerStateCopyWithImpl<_DistanceTrackerState>(
          this, _$identity);
}

abstract class _DistanceTrackerState extends DistanceTrackerState {
  const factory _DistanceTrackerState(
      {required TrackRecordModel? trackRecordModel,
      required bool isSubmitting,
      required bool isSuccess,
      required bool isFailure,
      required String info}) = _$_DistanceTrackerState;
  const _DistanceTrackerState._() : super._();

  @override
  TrackRecordModel? get trackRecordModel;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$DistanceTrackerStateCopyWith<_DistanceTrackerState> get copyWith =>
      throw _privateConstructorUsedError;
}
