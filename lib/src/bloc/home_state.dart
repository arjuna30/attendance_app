part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessFetchAttendanceState extends HomeState {
  final List<Attendance> attendances;

  SuccessFetchAttendanceState(this.attendances);
}

class ErrorHomeState extends HomeState {
  final dynamic e;
  ErrorHomeState(this.e);
}
