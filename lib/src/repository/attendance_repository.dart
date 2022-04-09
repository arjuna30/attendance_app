import 'package:attendance_app/src/model/attendance.dart';
import 'package:attendance_app/src/repository/database/attendance_database.dart';
import 'package:attendance_app/src/repository/database/table/attendance_table.dart';

class AttendanceRepository {
  final AttendanceDatabase _attendanceDatabase;
  AttendanceRepository(this._attendanceDatabase);

  Future<List<Attendance>> fetchAttendanceDatas(String email) async {
    final attendances = <Attendance>[];
    final records = await _attendanceDatabase.getAttendancesData(email);
    for (final record in records) {
      attendances.add(record.toModel());
    }
    return attendances;
  }

  Future<void> submitAttendance({
    required String email,
    required double latitude,
    required double longitude,
    required DateTime timeStamp,
  }) async {
    final attendance = Attendance(
        email: email,
        latitude: latitude,
        longitude: longitude,
        timeStamp: timeStamp);
    await _attendanceDatabase.insertAttendanceData(attendance);
  }
}
