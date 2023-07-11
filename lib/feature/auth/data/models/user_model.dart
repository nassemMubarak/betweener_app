import 'package:betweener_app/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.name,
      required super.email,
      required super.token,
      required super.id,
      required super.updated_at,
      required super.created_at,
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      updated_at: json['updated_at'],
      created_at: json['created_at'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'updated_at': updated_at,
      'created_at': created_at,
      'token': token
    };
  }
}
