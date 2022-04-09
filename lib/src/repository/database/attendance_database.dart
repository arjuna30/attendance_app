import 'package:attendance_app/src/model/attendance.dart';
import 'package:attendance_app/src/repository/database/table/attendance_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'attendance_database.g.dart';

@UseMoor(tables: [AttendanceTable])
class AttendanceDatabase extends _$AttendanceDatabase {
  AttendanceDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'attendance.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<AttendanceRecord>> getAttendancesData(String email) async =>
      await (select(attendanceTable)..where((tbl) => tbl.email.equals(email)))
          .get();

  Future<void> insertAttendanceData(Attendance attendance) async {
    final record = attendance.toRecord();
    await into(attendanceTable).insert(record);
  }
}
