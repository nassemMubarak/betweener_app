import 'package:betweener_app/core/api/api_controller.dart';
import 'package:betweener_app/core/api/api_sittings.dart';
import 'package:betweener_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';
import 'package:betweener_app/injection_container.dart' as di;

abstract class RemoteDataSource {
  Future<void> addLink({required LinkModel linkModel});

  Future<List<LinkModel>> getMyLinks();

  Future<void> removeLink({required String linkId});

  Future<void> editLink({required LinkModel linkModel});
}

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<void> addLink({required LinkModel linkModel}) async {
    await ApiController().post(
      Uri.parse('${ApiSettings().BASE_URL}${ApiSettings().LINKS}'),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
      body: {
        'title': linkModel.title,
        'link': linkModel.link,
        'username': linkModel.username,
      },
    );
  }

  @override
  Future<void> editLink({required LinkModel linkModel}) async {
    await ApiController().put(
      Uri.parse('${ApiSettings().BASE_URL}${ApiSettings().LINKS}/${linkModel.id.toString()}'),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
      body: {
        'title': linkModel.title,
        'link': linkModel.link,
        'username': linkModel.username,
        // 'isActive': linkModel.isActive,
      },
    );
  }

  @override
  Future<List<LinkModel>> getMyLinks() async {
    Map links = await ApiController().get(
      Uri.parse(ApiSettings().BASE_URL + ApiSettings().LINKS),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
      numberOfSecondsToSave: 9999999999999999,
    );
    return (links['links'] as List).map((e) => LinkModel.fromMap(e)).toList();
  }

  @override
  Future<void> removeLink({required String linkId}) async {
    await ApiController().delete(
      Uri.parse('${ApiSettings().BASE_URL}${ApiSettings().LINKS}/$linkId'),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
    );
  }

  Future<String> getToken() async {
    return (await di.sl<AuthLocalDataSource>().getCurrentUser()).token;
  }
}
