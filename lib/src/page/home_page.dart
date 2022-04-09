import 'dart:async';

import 'package:attendance_app/src/bloc/home_bloc.dart';
import 'package:attendance_app/src/bloc/user_bloc.dart';
import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/model/user.dart';
import 'package:attendance_app/src/page/add_attendance_page.dart';
import 'package:attendance_app/src/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final route =
      ChildRoute('/home', child: (context, args) => const HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(kMasterDataLatitude, kMasterDataLongitude),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    late User user;
    Set<Circle> circles = {
      const Circle(
          circleId: CircleId('radius'),
          center: LatLng(kMasterDataLatitude, kMasterDataLongitude),
          radius: 500,
          strokeColor: Color(0x00000000),
          fillColor: Color(0x251bb8d4))
    };

    List<Marker> masterMarker = [
      Marker(
        markerId: const MarkerId('master'),
        position: const LatLng(kMasterDataLatitude, kMasterDataLongitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      )
    ];

    return MultiBlocProvider(
      providers: const [
        // BlocProvider(create: UserBloc.create),
        // BlocProvider(create: LocationCubit.create),
        BlocProvider(create: HomeBloc.create),
      ],
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MaterialButton(
          shape: const CircleBorder(),
          onPressed: () async {
            await Modular.to.pushNamed(AddAttendancePage.route.name).then(
                (value) => {
                      ReadContext(context)
                          .read<HomeBloc>()
                          .add(FetchAttendancesEvent(user.email))
                    });
          },
          color: kMainColor,
          height: 50,
          child: const Text('+',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  ReadContext(context).read<UserBloc>().add(SignOutUserEvent());
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is SuccessFetchUserState) {
              user = state.user;
              ReadContext(context)
                  .read<HomeBloc>()
                  .add(FetchAttendancesEvent(user.email));
            }
            if (state is SuccessSignOutUserState) {
              Modular.to.pushReplacementNamed(LoginPage.route.name);
            }
          },
          builder: (context, state) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is SuccessFetchAttendanceState) {
                  final attendances = state.attendances;
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Master Data Location'),
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: GoogleMap(
                                markers: masterMarker.toSet(),
                                circles: circles,
                                mapType: MapType.normal,
                                initialCameraPosition: _kGooglePlex,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          if (attendances.isNotEmpty)
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: attendances.length,
                                itemBuilder: (context, index) {
                                  final attendance = attendances[index];
                                  return AttendanceCard(
                                      time: attendance.timeStamp);
                                }),
                          // MainSubmitButton(
                          //   text: 'Sign Out',
                          //   onPressed: () {
                          //     ReadContext(context)
                          //         .read<UserBloc>()
                          //         .add(SignOutUserEvent());
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  );
                }
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Master Data Location'),
                        Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: GoogleMap(
                              markers: masterMarker.toSet(),
                              circles: circles,
                              mapType: MapType.normal,
                              initialCameraPosition: _kGooglePlex,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final DateTime time;
  const AttendanceCard({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Submit time:'),
              Text(time.hour.toString() + ':' + time.minute.toString()),
            ],
          )),
    );
  }
}
