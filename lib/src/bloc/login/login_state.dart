part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final User user;
  SuccessLoginState(this.user);
}

class ErrorLoginState extends LoginState {
  final dynamic e;
  ErrorLoginState([this.e]);
}
