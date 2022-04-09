part of 'add_attendance_bloc.dart';

@immutable
abstract class AddAttendanceState {}

class AddAttendanceInitial extends AddAttendanceState {}

class LoadingAddAttendanceState extends AddAttendanceState {}

class SuccessSubmitAttendanceState extends AddAttendanceState {}

class ErrorSubmitAttendanceState extends AddAttendanceState {
  final dynamic e;

  ErrorSubmitAttendanceState(this.e);
}
