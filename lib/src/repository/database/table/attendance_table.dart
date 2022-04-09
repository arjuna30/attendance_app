import 'package:attendance_app/src/model/attendance.dart';
import 'package:attendance_app/src/repository/database/attendance_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('AttendanceRecord')
class AttendanceTable extends Table {
  TextColumn get email => text()();

  RealColumn get latitude => real()();

  RealColumn get longitude => real()();

  DateTimeColumn get timeStamp => dateTime()();
}

extension AttendanceRecordMapper on AttendanceRecord {
  Attendance toModel() => Attendance(
      email: email,
      latitude: latitude,
      longitude: longitude,
      timeStamp: timeStamp);
}

extension AttendanceMapper on Attendance {
  AttendanceRecord toRecord() => AttendanceRecord(
      email: email,
      latitude: latitude,
      longitude: longitude,
      timeStamp: timeStamp);
}
