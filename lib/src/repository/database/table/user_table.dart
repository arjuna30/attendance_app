import 'package:attendance_app/src/repository/database/user_database.dart';
import 'package:attendance_app/src/model/user.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('UserRecord')
class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get password => text()();
}

@DataClassName('LoggedUserRecord')
class LoggedUserTable extends UserTable {}

extension UserRecordMapper on UserRecord {
  User toModel() => User(id: id, name: name, email: email, password: password);
}

extension LoggedUserRecordMapper on LoggedUserRecord {
  User toModel() => User(id: id, name: name, email: email, password: password);
}

extension UserMapper on User {
  UserRecord toRecord() =>
      UserRecord(id: id, name: name, email: email, password: password);

  LoggedUserRecord toRecordLogged() =>
      LoggedUserRecord(id: id, name: name, email: email, password: password);

  UserTableCompanion toRecordCompanion() => UserTableCompanion(
      name: Value(name), email: Value(email), password: Value(password));
}
