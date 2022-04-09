import 'package:attendance_app/src/page/add_attendance_page.dart';
import 'package:attendance_app/src/page/home_page.dart';
import 'package:attendance_app/src/page/initial_page.dart';
import 'package:attendance_app/src/page/login_page.dart';
import 'package:attendance_app/src/page/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

final pageRoutes = <ModularRoute>[
  InitialPage.route,
  HomePage.route,
  LoginPage.route,
  RegisterPage.route,
  AddAttendancePage.route
];
