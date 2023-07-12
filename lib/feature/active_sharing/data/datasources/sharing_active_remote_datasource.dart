import 'package:betweener_app/core/api/api_controller.dart';
import 'package:betweener_app/core/api/api_sittings.dart';
import 'package:betweener_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/injection_container.dart' as di;

abstract class ActiveSharingRemoteDataSource {
  Future<List<UserModel>> getNearUser();
  Future<void> setActive();
  Future<void> deleteActive();
}

class ActiveSharingRemoteDataSourceImp implements ActiveSharingRemoteDataSource {
  @override
  Future<void> setActive() async {
    await ApiController().post(
      Uri.parse('${ApiSettings().BASE_URL}${ApiSettings().ACTIVE_SHARE}/${await getUserId()}'),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
      body: {
        'type': 'receiver',
      },
    );
  }

  @override
  Future<void> deleteActive() async {
    await ApiController().delete(
      Uri.parse('${ApiSettings().BASE_URL}${ApiSettings().ACTIVE_SHARE}/${await getUserId()}'),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
    );
  }

  @override
  Future<List<UserModel>> getNearUser() async {
    print('users');
    Map users = await ApiController().get(
      Uri.parse('${ApiSettings().BASE_URL}${ApiSettings().ACTIVE_SHARE}/nearest/${await getUserId()}'),
      headers: {'Authorization': 'Bearer ${await getToken()}'},
    );
    print(users);
    return (users['nearest-users'] as List).map<UserModel>((e) => UserModel.fromJson(e['user'])).toList();
  }

  Future<String> getToken() async {
    return (await di.sl<AuthLocalDataSource>().getCurrentUser()).token;
  }

  Future<String> getUserId() async {
    return (await di.sl<AuthLocalDataSource>().getCurrentUser()).id.toString();
  }
}
