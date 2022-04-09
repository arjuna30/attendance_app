part of 'add_attendance_bloc.dart';

@immutable
abstract class AddAttendanceEvent {}

class SubmitAttendanceEvent extends AddAttendanceEvent {
  final String email;
  final double latitude;
  final double longitude;
  final DateTime timeStamp;

  SubmitAttendanceEvent({
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.timeStamp,
  });
}
