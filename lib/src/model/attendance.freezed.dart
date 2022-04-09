// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttendanceTearOff {
  const _$AttendanceTearOff();

  _Attendance call(
      {required String email,
      required double latitude,
      required double longitude,
      required DateTime timeStamp}) {
    return _Attendance(
      email: email,
      latitude: latitude,
      longitude: longitude,
      timeStamp: timeStamp,
    );
  }
}

/// @nodoc
const $Attendance = _$AttendanceTearOff();

/// @nodoc
mixin _$Attendance {
  String get email => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res>;
  $Res call(
      {String email, double latitude, double longitude, DateTime timeStamp});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res> implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  final Attendance _value;
  // ignore: unused_field
  final $Res Function(Attendance) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$AttendanceCopyWith<$Res> implements $AttendanceCopyWith<$Res> {
  factory _$AttendanceCopyWith(
          _Attendance value, $Res Function(_Attendance) then) =
      __$AttendanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email, double latitude, double longitude, DateTime timeStamp});
}

/// @nodoc
class __$AttendanceCopyWithImpl<$Res> extends _$AttendanceCopyWithImpl<$Res>
    implements _$AttendanceCopyWith<$Res> {
  __$AttendanceCopyWithImpl(
      _Attendance _value, $Res Function(_Attendance) _then)
      : super(_value, (v) => _then(v as _Attendance));

  @override
  _Attendance get _value => super._value as _Attendance;

  @override
  $Res call({
    Object? email = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timeStamp = freezed,
  }) {
    return _then(_Attendance(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Attendance implements _Attendance {
  const _$_Attendance(
      {required this.email,
      required this.latitude,
      required this.longitude,
      required this.timeStamp});

  @override
  final String email;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime timeStamp;

  @override
  String toString() {
    return 'Attendance(email: $email, latitude: $latitude, longitude: $longitude, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Attendance &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.timeStamp, timeStamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(timeStamp));

  @JsonKey(ignore: true)
  @override
  _$AttendanceCopyWith<_Attendance> get copyWith =>
      __$AttendanceCopyWithImpl<_Attendance>(this, _$identity);
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {required String email,
      required double latitude,
      required double longitude,
      required DateTime timeStamp}) = _$_Attendance;

  @override
  String get email;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  DateTime get timeStamp;
  @override
  @JsonKey(ignore: true)
  _$AttendanceCopyWith<_Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}
