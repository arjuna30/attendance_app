import 'dart:async';

import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/model/user.dart';
import 'package:attendance_app/src/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  static LoginBloc create(BuildContext context) => LoginBloc(Modular.get());

  LoginBloc(this._userRepository) : super(LoginInitial()) {
    on<LoggingInEvent>(_loggingIn);
  }

  Future<void> _loggingIn(LoggingInEvent event, Emitter emit) async {
    try {
      emit(LoadingLoginState());
      final _pref = await SharedPreferences.getInstance();
      final user = await _userRepository.checkUserOnDatabase(
          event.email, event.password);
      if (user != null) {
        _pref.setBool(kLoggedInKey, true);
        await _userRepository.insertLoggedUser(user);
        emit(SuccessLoginState(user));
      } else {
        throw Exception();
      }
    } on Exception catch (_) {
      emit(ErrorLoginState('Email/Password is not correct.'));
    }
  }
}
