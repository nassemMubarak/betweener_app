import 'dart:convert';

import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/core/shared_pref/shared_pref.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';
import 'package:dartz/dartz.dart';

abstract class LocalDataSource {
  Future<List<LinkModel>> getMyLinks();

  Future<Unit> cacheMyLinks(List<LinkModel> linksModel);
}

class LocalDataSourceImp implements LocalDataSource {
  final SharedPrefController sharedPreferences;

  LocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheMyLinks(List<LinkModel> linkModel) {
    List linkModelToJson = linkModel.map<Map<String, dynamic>>((postModel) => postModel.toMap()).toList();
    sharedPreferences.save(key: 'links', value: json.encode(linkModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<LinkModel>> getMyLinks() async {
    final jsonString = sharedPreferences.get(key: 'links');
    if (jsonString != null) {
      List decode = json.decode(jsonString);
      final List<LinkModel> userModel = decode.map<LinkModel>((jsonPostModel) => LinkModel.fromMap(jsonPostModel)).toList();
      return Future.value(userModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
