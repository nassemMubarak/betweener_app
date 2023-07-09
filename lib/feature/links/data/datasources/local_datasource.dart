import 'dart:convert';

import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<LinkModel>> getMyLinks();

  Future<Unit> cacheMyLinks(List<LinkModel> linksModel);
}

class LocalDataSourceImp implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheMyLinks(List<LinkModel> linkModel) {
    List linkModelToJson = linkModel.map<Map<String, dynamic>>((postModel) => postModel.toMap()).toList();
    sharedPreferences.setString('links', json.encode(linkModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<LinkModel>> getMyLinks() async {
    final jsonString = sharedPreferences.getString('links');
    if (jsonString != null) {
      List decode = json.decode(jsonString);
      final List<LinkModel> userModel = decode.map<LinkModel>((jsonPostModel) => LinkModel.fromMap(jsonPostModel)).toList();
      return Future.value(userModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
