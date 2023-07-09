import 'package:betweener_app/feature/links/data/models/link_model.dart';

abstract class RemoteDataSource {
  Future<void> addLink({required LinkModel linkModel});
  Future<List<LinkModel>> getMyLinks();
  Future<void> removeLink({required String linkId});
  Future<void> editLink({required LinkModel linkModel});
}

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<void> addLink({required LinkModel linkModel}) {
    // TODO: implement addLink
    throw UnimplementedError();
  }

  @override
  Future<void> editLink({required LinkModel linkModel}) {
    // TODO: implement editLink
    throw UnimplementedError();
  }

  @override
  Future<List<LinkModel>> getMyLinks() {
    // TODO: implement getMyLinks
    throw UnimplementedError();
  }

  @override
  Future<void> removeLink({required String linkId}) {
    // TODO: implement removeLink
    throw UnimplementedError();
  }
}
