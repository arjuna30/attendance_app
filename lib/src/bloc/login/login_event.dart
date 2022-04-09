part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoggingInEvent extends LoginEvent {
  final String email;
  final String password;

  LoggingInEvent(this.email, this.password);
}
