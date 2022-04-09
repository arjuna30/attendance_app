import 'dart:async';

import 'package:attendance_app/src/bloc/attendance/add_attendance_bloc.dart';
import 'package:attendance_app/src/bloc/location_cubit.dart';
import 'package:attendance_app/src/bloc/user_bloc.dart';
import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/model/user.dart';
import 'package:attendance_app/src/widget/button/main_submit_button.dart';
import 'package:attendance_app/src/widget/dialog/info_dialog.dart';
import 'package:attendance_app/src/widget/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAttendancePage extends StatefulWidget {
  static final route = ChildRoute('/add-attendance',
      child: (context, args) => const AddAttendancePage());

  const AddAttendancePage({Key? key}) : super(key: key);

  @override
  State<AddAttendancePage> createState() => _AddAttendancePageState();
}

class _AddAttendancePageState extends State<AddAttendancePage> {
  final Completer<GoogleMapController> _controller = Completer();
  // CameraPosition _kGooglePlex = const CameraPosition(
  //   target: LatLng(kMasterDataLatitude, kMasterDataLongitude),
  //   zoom: 12,
  // );

  final formKey = GlobalKey<FormState>();
  late Position position;
  CameraPosition? _kGooglePlex;
  late User user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        BlocProvider(create: AddAttendanceBloc.create),
        BlocProvider(create: LocationCubit.create),
        BlocProvider(create: UserBloc.create),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Attendance')),
        body: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is SuccessFetchUserState) {
              user = state.user;
            }
          },
          child: BlocConsumer<AddAttendanceBloc, AddAttendanceState>(
            listener: (context, state) {
              if (state is LoadingAddAttendanceState) {
                LoadingDialog.showLoadingDialog(context);
              }
              if (state is SuccessSubmitAttendanceState) {
                Modular.to.pop();
                Modular.to.pop();
                InfoDialog.showInfoDialog(context, 'Success Submit Attendance');
              }
              if (state is ErrorSubmitAttendanceState) {
                Modular.to.pop();
                InfoDialog.showInfoDialog(
                    context, 'Something wrong, please try again');
              }
            },
            builder: (context, state) {
              final locationCubit = ReadContext(context).read<LocationCubit>();
              if (state is ErrorLocationState) {
                return const Center(
                    child: Text('Please allow the GPS permission.'));
              }
              return BlocConsumer<LocationCubit, LocationState>(
                listener: (context, state) {
                  if (state is LoadingLocationState) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is SuccessFetchCurrentLocationState) {
                    Modular.to.pop();
                    position = state.position;

                    masterMarker.add(Marker(
                      markerId: const MarkerId('current'),
                      position: LatLng(position.latitude, position.longitude),
                    ));

                    _kGooglePlex = CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 12,
                    );
                  }
                  if (state is ErrorLocationState) {
                    Modular.to.pop();
                  }
                  if (state is UserInRadiusArea) {
                    final attendanceBloc =
                        ReadContext(context).read<AddAttendanceBloc>();
                    final currentTime = DateTime.now();
                    attendanceBloc.add(SubmitAttendanceEvent(
                      email: user.email,
                      latitude: position.latitude,
                      longitude: position.longitude,
                      timeStamp: currentTime,
                    ));
                  }
                  if (state is UserOutRadiusArea) {
                    InfoDialog.showInfoDialog(
                        context, 'You are too far from office!');
                  }
                },
                builder: (context, state) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: (_kGooglePlex != null)
                                ? GoogleMap(
                                    markers: masterMarker.toSet(),
                                    circles: circles,
                                    mapType: MapType.normal,
                                    initialCameraPosition: _kGooglePlex!,
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      _controller.complete(controller);
                                    },
                                  )
                                : const Center(
                                    child: Text('Checking GPS Location.')),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: const [],
                            ),
                          ),
                          const Spacer(),
                          MainSubmitButton(
                            text: 'Submit',
                            onPressed: () async {
                              await locationCubit.checkDistance(
                                  startLatitude: kMasterDataLatitude,
                                  startLongitude: kMasterDataLongitude,
                                  endLatitude: position.latitude,
                                  endLongitude: position.longitude);
                            },
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
      ),
    );
  }
}
