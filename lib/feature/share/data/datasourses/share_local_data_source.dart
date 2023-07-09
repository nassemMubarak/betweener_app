import 'package:betweener_app/feature/share/data/models/share_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShareLocalDataSource{
  Future<Unit> saveShare({required ShareModel shareModel});
  Future<List<ShareModel>> getAllShare();
}
class ShareLocalDataSourceImpl implements ShareLocalDataSource{
  @override
  Future<List<ShareModel>> getAllShare() {
    // TODO: implement getAllShare
    throw UnimplementedError();
  }

  @override
  Future<Unit> saveShare({required ShareModel shareModel}) {
    // TODO: implement saveShare
    throw UnimplementedError();
  }

}