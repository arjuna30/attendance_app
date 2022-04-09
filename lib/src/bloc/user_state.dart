part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class SuccessFetchUserState extends UserState {
  final User user;

  SuccessFetchUserState(this.user);
}

class SuccessSignOutUserState extends UserState {}

class ErrorUserState extends UserState {
  final dynamic e;

  ErrorUserState(this.e);
}
