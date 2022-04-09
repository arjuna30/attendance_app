import 'package:attendance_app/src/repository/location_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository _locationRepository;
  static LocationCubit create(BuildContext context) =>
      LocationCubit(Modular.get())..fetchCurrentLocation();

  LocationCubit(this._locationRepository) : super(LocationInitial());

  Future<void> checkPermission() async {
    _locationRepository.checkPermission();
  }

  Future<void> checkDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) async {
    final distance = await _locationRepository.checkDistance(
        startLatitude: startLatitude,
        startLongitude: startLongitude,
        endLatitude: endLatitude,
        endLongitude: endLongitude);
    if (distance <= 50) {
      emit(UserInRadiusArea(distance));
    } else {
      emit(UserOutRadiusArea(distance));
    }
  }

  Future<void> fetchCurrentLocation() async {
    try {
      await checkPermission();
      emit(LoadingLocationState());
      final position = await _locationRepository.fetchCurrentLocation();
      emit(SuccessFetchCurrentLocationState(position));
    } catch (e) {
      emit(ErrorLocationState(e));
    }
  }
}
