import 'package:attendance_app/src/app_module.dart';
import 'package:attendance_app/src/bloc/home_bloc.dart';
import 'package:attendance_app/src/bloc/location_cubit.dart';
import 'package:attendance_app/src/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        BlocProvider(create: UserBloc.create),
        BlocProvider(create: LocationCubit.create),
        // BlocProvider(create: HomeBloc.create),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Attendance App',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
