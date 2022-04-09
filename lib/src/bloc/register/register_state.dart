part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  final User user;

  SuccessRegisterState(this.user);
}

class ErrorRegisterState extends RegisterState {
  final dynamic e;

  ErrorRegisterState([this.e]);
}
