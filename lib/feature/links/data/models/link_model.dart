import 'package:betweener_app/feature/links/domain/entities/link.dart';

class LinkModel extends Link {
  LinkModel({
    required super.id,
    required super.title,
    required super.link,
    required super.username,
    required super.isActive,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    return LinkModel(
      id: map['id'],
      link: map['link'],
      userId: map['user_id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      title: map['title'],
      isActive: map['isActive'],
      username: map['username'] ?? '',
    );
  }

  factory LinkModel.fromLink({required Link link}) {
    return LinkModel(
      username: link.username,
      link: link.link,
      id: link.id,
      isActive: link.isActive,
      title: link.title,
      createdAt: link.createdAt,
      userId: link.userId,
      updatedAt: link.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = super.id;
    data['title'] = super.title;
    data['link'] = super.link;
    data['username'] = super.username;
    data['isActive'] = super.isActive;
    data['user_id'] = super.userId;
    data['created_at'] = super.createdAt;
    data['updated_at'] = super.updatedAt;
    return data;
  }
}
