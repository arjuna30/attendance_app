import 'dart:async';

import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/model/user.dart';
import 'package:attendance_app/src/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;
  static RegisterBloc create(BuildContext context) =>
      RegisterBloc(Modular.get());

  RegisterBloc(this._userRepository) : super(RegisterInitial()) {
    on<SignUpEvent>(_signUp);
  }

  Future<void> _signUp(SignUpEvent event, Emitter emit) async {
    try {
      emit(LoadingRegisterState());
      final _pref = await SharedPreferences.getInstance();
      final isEmailRegistered =
          await _userRepository.isEmailRegistered(event.email);
      if (!isEmailRegistered) {
        await _userRepository.insertUser(
            event.name, event.email, event.password);
        final user = await _userRepository.checkUserOnDatabase(
            event.email, event.password);
        await _userRepository.insertLoggedUser(user!);
        _pref.setBool(kLoggedInKey, true);
        emit(SuccessRegisterState(user));
      } else {
        emit(ErrorRegisterState('Email has been registered'));
      }
    } catch (e) {
      emit(ErrorRegisterState(e));
    }
  }
}
