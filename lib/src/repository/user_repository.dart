import 'dart:convert';

import 'package:attendance_app/src/model/user.dart';
import 'package:attendance_app/src/repository/database/table/user_table.dart';
import 'package:attendance_app/src/repository/database/user_database.dart';

class UserRepository {
  final UserDatabase _userDatabase;

  UserRepository(this._userDatabase);

  Future<User> fetchUser(String email) async {
    final userRecord = await _userDatabase.getUserDataByEmail(email);
    return userRecord!.toModel();
  }

  Future<User?> checkUserOnDatabase(String email, String password) async {
    final password64 = base64.encode(utf8.encode(password));
    final record =
        await _userDatabase.getUserDataByEmailAndPassword(email, password64);
    if (record != null) {
      final decodedPassword = utf8.decode(base64Decode(record.password));
      final recordWithDecodedPassword =
          record.copyWith(password: decodedPassword);
      return recordWithDecodedPassword.toModel();
    } else {
      return null;
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    final userRecord = await _userDatabase.getUserDataByEmail(email);
    return userRecord != null;
  }

  Future<void> insertUser(String name, String email, String password) async {
    final password64 = base64.encode(utf8.encode(password));
    await _userDatabase.insertUserData(name, email, password64);
  }

  //LOGGED USER

  Future<User> fetchLoggedUser() async {
    final loggedUserRecord = await _userDatabase.fetchLoggedUser();
    final decodedPassword =
        utf8.decode(base64Decode(loggedUserRecord.password));
    final loggedUserwithDecodedPassword =
        loggedUserRecord.copyWith(password: decodedPassword);
    final loggedUser = loggedUserwithDecodedPassword.toModel();
    return loggedUser;
  }

  Future<void> insertLoggedUser(User user) async {
    final password64 = base64.encode(utf8.encode(user.password));
    await _userDatabase.insertLoggedUser(
        user.id, user.name, user.email, password64);
  }

  Future<void> deleteLoggedUser() async =>
      await _userDatabase.deleteLoggedUserData();
}
