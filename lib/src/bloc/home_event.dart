part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchAttendancesEvent extends HomeEvent {
  final String email;

  FetchAttendancesEvent(this.email);
}
