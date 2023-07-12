import 'package:betweener_app/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.token,
    required super.id,
    required super.updated_at,
    required super.created_at,
    super.email_verified_at,
    super.isActive,
    super.country,
    super.ip,
    super.long,
    super.lat,
    super.fcm,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      updated_at: json['updated_at'],
      created_at: json['created_at'],
      token: json['token'] ?? '',
      email_verified_at: json['email_verified_at'],
      isActive: json['isActive'],
      country: json['country'],
      ip: json['ip'],
      long: json['long'],
      lat: json['lat'],
      fcm: json['fcm'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'updated_at': updated_at,
      'created_at': created_at,
      'token': token,
      'email_verified_at': email_verified_at,
      'isActive': isActive,
      'country': country,
      'ip': ip,
      'long': long,
      'lat': lat,
      'fcm': fcm,
    };
  }
}
