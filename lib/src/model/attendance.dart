import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required String email,
    required double latitude,
    required double longitude,
    required DateTime timeStamp,
  }) = _Attendance;
}
