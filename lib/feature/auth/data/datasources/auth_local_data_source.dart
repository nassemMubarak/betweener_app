import 'dart:convert';

import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
abstract class AuthLocalDataSource{
  Future<UserModel> getCurrentUser();
  Future<Unit> saveUser({required UserModel userModel});
  Future<Unit> logout();
}
const CACHED_USER = 'CACHED_USER';

class AuthLocalDataSourceImpl implements AuthLocalDataSource{
   final SharedPreferences preferences;

   AuthLocalDataSourceImpl({required this.preferences});
   @override
   Future<Unit> saveUser({required UserModel userModel}) async{
     print('------------------------------------------------');
      await preferences.setString(CACHED_USER, json.encode(userModel));
      print('+++++++++++++++++++++++++++++++++++++${preferences.getString(CACHED_USER)}');
      return Future.value(unit);
   }
  @override
  Future<UserModel> getCurrentUser() async{
    final jsonString = preferences.getString(CACHED_USER);
    if(jsonString != null){
        return UserModel.fromJson(json.decode(jsonString));
    }else{
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> logout()async {
    await preferences.remove(CACHED_USER);
    return Future.value(unit);
  }



}