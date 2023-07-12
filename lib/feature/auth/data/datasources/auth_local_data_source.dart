import 'dart:convert';

import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/core/shared_pref/shared_pref.dart';
import 'package:dartz/dartz.dart';

import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> getCurrentUser();
  Future<Unit> saveUser({required UserModel userModel});
  Future<Unit> logout();
}

const String CACHED_USER = 'CACHED_USER';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // final SharedPreferences preferences;

  // AuthLocalDataSourceImpl({required this.preferences});
  AuthLocalDataSourceImpl();
  @override
  Future<Unit> saveUser({required UserModel userModel}) async {
    await SharedPrefController().save(key: CACHED_USER, value: json.encode(userModel));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final jsonString = SharedPrefController().get(key: CACHED_USER);
    if (jsonString != null) {
      return UserModel.fromJson(json.decode(jsonString));
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> logout() async {
    await SharedPrefController().removeKey(key: CACHED_USER);
    return Future.value(unit);
  }
}
