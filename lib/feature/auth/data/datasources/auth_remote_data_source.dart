import 'dart:convert';

import 'package:betweener_app/core/string/api_path_strings.dart';
import 'package:http/http.dart';

import '../../../../core/error/exception.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> loginUser({required Map authData});

  Future<UserModel> registerUser({required Map authData});

  Future<UserModel> loginWithGoogleUser({required Map authData});
}


class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> registerUser({required Map authData}) async {
    final body = {
      "name": authData['name'],
      "email": authData['email'],
      "password": authData['password'],
      "password_confirmation": authData['password'],

    };
    final response =
        await client.post(Uri.parse(ApiPathStrings.BASE_URL+ApiPathStrings.RGISTER_URL), body: body);
    return _loginOrRegisterUser(response);
  }

  @override
  Future<UserModel> loginUser({required Map authData}) async {
    final body = {
      "email": authData['email'],
      "password": authData['password'],
    };

    final response =
        await client.post(Uri.parse(ApiPathStrings.BASE_URL+ApiPathStrings.LOGIN_URL), body: body);
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return _loginOrRegisterUser(response);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw InvalidDataException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> loginWithGoogleUser({required Map authData}) async {
    final body = {
      "name": authData['name'],
      "email": authData['email'],
      "password": authData['password'],
      "password_confirmation": authData['password_confirmation'],
    };
    final response =
        await client.post(Uri.parse('${ApiPathStrings.BASE_URL}/auth/signup'), body: body);
    return _loginOrRegisterUser(response);
  }

  Future<UserModel> _loginOrRegisterUser(Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodeJson = jsonDecode(response.body);
      print(decodeJson);
      final jsonUser = decodeJson['user'] ;
      jsonUser['token'] = decodeJson['token'];
      UserModel userModel = UserModel.fromJson(jsonUser);
      return userModel;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw InvalidDataException();
    } else {
      throw ServerException();
    }
  }
}
