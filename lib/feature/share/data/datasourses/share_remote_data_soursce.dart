import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/feature/share/data/models/share_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class ShareRemoteDataSource{
  Future<List<ShareModel>> getAllShare();
  Future<UserModel> scanAccount({required Map scanData});
  Future<Unit> addShare({required ShareModel shareModel});
}
class ShareRemoteDataSourceImpl implements ShareRemoteDataSource{
  final http.Client client;

  ShareRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> addShare({required ShareModel shareModel}) {
    // TODO: implement addShare
    throw UnimplementedError();
  }

  @override
  Future<List<ShareModel>> getAllShare() {
    // TODO: implement getAllShare
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeShare({required ShareModel shareModel}) {
    // TODO: implement removeShare
    throw UnimplementedError();
  }

  @override
  Future<UserModel> scanAccount({required Map scanData}) {
    // TODO: implement scanAccount
    throw UnimplementedError();
  }

}