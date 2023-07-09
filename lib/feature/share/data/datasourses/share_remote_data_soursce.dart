import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/feature/share/data/models/share_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShareRemoteDataSource{
  Future<List<UserModel>> getAllShare();
  Future<Unit> addShare({required ShareModel shareModel});
  Future<Unit> updateShare({required ShareModel shareModel});
  Future<Unit> removeShare({required ShareModel shareModel});
}
class ShareRemoteDataSourceImpl implements ShareRemoteDataSource{
  @override
  Future<Unit> addShare({required ShareModel shareModel}) {
    // TODO: implement addShare
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllShare() {
    // TODO: implement getAllShare
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeShare({required ShareModel shareModel}) {
    // TODO: implement removeShare
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateShare({required ShareModel shareModel}) {
    // TODO: implement updateShare
    throw UnimplementedError();
  }
}