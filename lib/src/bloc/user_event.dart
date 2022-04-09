part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class FetchLoggedUserEvent extends UserEvent {}

class SignOutUserEvent extends UserEvent {}
