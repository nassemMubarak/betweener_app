import 'dart:convert';

import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/feature/share/data/models/share_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ShareLocalDataSource {
  Future<Unit> cacheShare({required List<ShareModel> shareModel});

  Future<List<ShareModel>> getAllShare();
}

const CACHED_SHARE = 'CACHED_SHARE';

class ShareLocalDataSourceImpl implements ShareLocalDataSource {
  final SharedPreferences preferences;

  ShareLocalDataSourceImpl({required this.preferences});

  @override
  Future<List<ShareModel>> getAllShare() async {
    final jsonJson = preferences.getString(CACHED_SHARE);
    if (jsonJson != null) {
      List decodeJsonData = json.decode(jsonJson);
      List<ShareModel> jsonToShareModel = decodeJsonData
          .map<ShareModel>((shareModel) => ShareModel.fromJson(shareModel))
          .toList();
      return Future.value(jsonToShareModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cacheShare({required List<ShareModel> shareModel}) {
  List shareModelToJson = shareModel.map<Map<String,dynamic>>((shareModel) => shareModel.toJson()).toList();
  preferences.setString(CACHED_SHARE, json.encode(shareModelToJson));
return Future.value(unit);
  }
}
