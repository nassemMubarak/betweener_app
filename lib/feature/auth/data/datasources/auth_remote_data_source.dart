import 'dart:convert';

import 'package:http/http.dart';

import '../../../../core/error/exception.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> loginUser({required Map authData});

  Future<UserModel> registerUser({required Map authData});

  Future<UserModel> loginWithGoogleUser({required Map authData});
}

const BASE_URI = 'https://laundry-izfq.onrender.com';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> registerUser({required Map authData}) async {
    final body = {
      "name": authData['name'],
      "email": authData['email'],
      "password": authData['password'],
      "phone": authData['phone'],
      "role": authData['role'],
      "latitude": authData['latitude'],
      "longitude": authData['longitude']
    };
    final response =
        await client.post(Uri.parse('$BASE_URI/auth/signup'), body: body);
    return _loginOrRegisterUser(response);
  }

  @override
  Future<UserModel> loginUser({required Map authData}) async {
    final body = {
      "email": authData['email'],
      "password": authData['password'],
    };
    final response =
        await client.post(Uri.parse('$BASE_URI/auth/login'), body: body);
      print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodeJson = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(decodeJson['user']);
      return userModel;
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
      "phone": authData['phone'],
      "role": authData['role'],
      "latitude": authData['latitude'],
      "longitude": authData['longitude']
    };
    final response =
        await client.post(Uri.parse('$BASE_URI/auth/signup'), body: body);
    return _loginOrRegisterUser(response);
  }

  Future<UserModel> _loginOrRegisterUser(Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodeJson = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(decodeJson['user']);
      return userModel;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw InvalidDataException();
    } else {
      throw ServerException();
    }
  }
}
