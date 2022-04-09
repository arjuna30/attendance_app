import 'package:attendance_app/src/component/page_route.dart';
import 'package:attendance_app/src/repository/attendance_repository.dart';
import 'package:attendance_app/src/repository/database/attendance_database.dart';
import 'package:attendance_app/src/repository/database/user_database.dart';
import 'package:attendance_app/src/repository/location_repository.dart';
import 'package:attendance_app/src/repository/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //factory
        Bind.factory((i) => AttendanceDatabase()),
        Bind.factory((i) => UserDatabase()),

        //singleton
        Bind.singleton((i) => AttendanceRepository(i())),
        Bind.singleton((i) => LocationRepository()),
        Bind.singleton((i) => UserRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => pageRoutes;
}
