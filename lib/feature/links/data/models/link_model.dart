import 'package:betweener_app/feature/links/domain/entities/link.dart';

class LinkModel extends Link {
  LinkModel({required super.name, required super.url, required super.id});

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    return LinkModel(
      name: map['name'],
      url: map['link'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': super.name,
      'link': super.url,
      'id': super.id,
    };
  }
}
