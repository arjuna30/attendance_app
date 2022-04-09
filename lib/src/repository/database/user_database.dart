import 'package:attendance_app/src/repository/database/table/user_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'user_database.g.dart';

@UseMoor(tables: [UserTable, LoggedUserTable])
class UserDatabase extends _$UserDatabase {
  UserDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'user.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<UserRecord>> getAllUserData() async =>
      await select(userTable).get();

  Future<UserRecord?> getUserDataByEmailAndPassword(
          String email, String password) async =>
      await (select(userTable)
            ..where((tbl) => tbl.email.equals(email))
            ..where((tbl) => tbl.password.equals(password)))
          .getSingleOrNull();

  Future<UserRecord?> getUserDataByEmail(String email) async =>
      await (select(userTable)..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();

  Future<void> insertUserData(
      String name, String email, String password) async {
    final userDataCompanion = UserTableCompanion(
        name: Value(name), email: Value(email), password: Value(password));
    await into(userTable).insert(userDataCompanion);
  }

  Future<void> deleteUserData(UserRecord userData) async =>
      await delete(userTable).delete(userData);

  //LOGGED USER

  Future<LoggedUserRecord> fetchLoggedUser() async =>
      await select(loggedUserTable).getSingle();

  Future<void> insertLoggedUser(
      int id, String name, String email, String password) async {
    final loggedUserRecord =
        LoggedUserRecord(id: id, name: name, email: email, password: password);
    await into(loggedUserTable).insert(loggedUserRecord);
  }

  Future<void> deleteLoggedUserData() async =>
      await delete(loggedUserTable).go();
}
