import 'dart:async';

import 'package:attendance_app/src/repository/attendance_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'add_attendance_event.dart';
part 'add_attendance_state.dart';

class AddAttendanceBloc extends Bloc<AddAttendanceEvent, AddAttendanceState> {
  final AttendanceRepository _attendanceRepository;
  static AddAttendanceBloc create(BuildContext context) =>
      AddAttendanceBloc(Modular.get());
  AddAttendanceBloc(this._attendanceRepository)
      : super(AddAttendanceInitial()) {
    on<SubmitAttendanceEvent>(_submitAttendance);
  }

  Future<void> _submitAttendance(
      SubmitAttendanceEvent event, Emitter emit) async {
    try {
      emit(LoadingAddAttendanceState());
      await _attendanceRepository.submitAttendance(
          email: event.email,
          latitude: event.latitude,
          longitude: event.longitude,
          timeStamp: event.timeStamp);
      emit(SuccessSubmitAttendanceState());
    } catch (e) {
      emit(ErrorSubmitAttendanceState(e));
    }
  }
}
