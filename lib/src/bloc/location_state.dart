part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LoadingLocationState extends LocationState {}

class SuccessFetchCurrentLocationState extends LocationState {
  final Position position;

  SuccessFetchCurrentLocationState(this.position);
}

class ErrorLocationState extends LocationState {
  final dynamic e;

  ErrorLocationState(this.e);
}

class UserInRadiusArea extends LocationState {
  final double distance;

  UserInRadiusArea(this.distance);
}

class UserOutRadiusArea extends LocationState {
  final double distance;

  UserOutRadiusArea(this.distance);
}
