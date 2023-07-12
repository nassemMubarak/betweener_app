import 'package:betweener_app/core/api/api_controller.dart';
import 'package:betweener_app/core/api/api_sittings.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';

abstract class RemoteDataSource {
  Future<void> addLink({required LinkModel linkModel});

  Future<List<LinkModel>> getMyLinks(String token);

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
  Future<List<LinkModel>> getMyLinks(String token) async {
    Map links = await ApiController().get(
      Uri.parse(ApiSettings().BASE_URL + ApiSettings().LINKS),
      headers: {'Authorization': 'Bearer $token'},
    );
    return (links['links'] as List).map((e) => LinkModel.fromMap(e)).toList();
  }

  @override
  Future<void> removeLink({required String linkId}) {
    // TODO: implement removeLink
    throw UnimplementedError();
  }
}
