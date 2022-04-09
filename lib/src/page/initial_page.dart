import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/page/home_page.dart';
import 'package:attendance_app/src/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/user_bloc.dart';

class InitialPage extends StatelessWidget {
  static final route = ChildRoute(Modular.initialRoute,
      child: (context, args) => const InitialPage());
  const InitialPage({Key? key}) : super(key: key);

  Future<bool> isLoggedIn() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool(kLoggedInKey) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) => (snapshot.data != null && snapshot.data!)
          ? const HomePage()
          : const LoginPage(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: UserBloc.create,
  //     child: BlocListener<UserBloc, UserState>(
  //       listener: (context, state) {
  //         if (state is SuccessFetchUserState) {
  //           Modular.to
  //               .pushReplacementNamed(HomePage.route.name);
  //         }
  //         if (state is ErrorUserState) {
  //           Modular.to
  //               .pushReplacementNamed(LoginPage.route.name);
  //         }
  //       },
  //       child: const Scaffold(body: SizedBox.shrink()),
  //     ),
  //   );
  // }
}
