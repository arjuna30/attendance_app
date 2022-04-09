import 'dart:async';

import 'package:attendance_app/src/model/attendance.dart';
import 'package:attendance_app/src/repository/attendance_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AttendanceRepository _attendanceRepository;
  static HomeBloc create(BuildContext context) => HomeBloc(Modular.get());

  HomeBloc(this._attendanceRepository) : super(HomeInitial()) {
    on<FetchAttendancesEvent>(_fetchData);
  }

  Future<void> _fetchData(FetchAttendancesEvent event, Emitter emit) async {
    try {
      emit(LoadingHomeState());
      final attendances =
          await _attendanceRepository.fetchAttendanceDatas(event.email);
      emit(SuccessFetchAttendanceState(attendances));
    } catch (e) {
      emit(ErrorHomeState(e));
    }
  }
}
