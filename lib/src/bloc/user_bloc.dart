import 'dart:async';

import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/model/user.dart';
import 'package:attendance_app/src/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  static UserBloc create(BuildContext context) =>
      UserBloc(Modular.get())..add(FetchLoggedUserEvent());

  UserBloc(this._userRepository) : super(UserInitial()) {
    on<FetchLoggedUserEvent>(_fetchLoggedUserData);
    on<SignOutUserEvent>(_signOut);
  }

  Future<void> _fetchLoggedUserData(
      FetchLoggedUserEvent event, Emitter emit) async {
    try {
      final user = await _userRepository.fetchLoggedUser();
      emit(SuccessFetchUserState(user));
    } catch (e) {
      emit(ErrorUserState(e));
    }
  }

  Future<void> _signOut(SignOutUserEvent event, Emitter emit) async {
    try {
      final _pref = await SharedPreferences.getInstance();
      _pref.setBool(kLoggedInKey, false);
      await _userRepository.deleteLoggedUser();
      emit(SuccessSignOutUserState());
    } catch (e) {
      emit(ErrorUserState(e));
    }
  }
}
