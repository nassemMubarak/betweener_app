import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String token;
  final String? email_verified_at;
  final int? isActive;
  final String? country;
  final String? ip;
  final double? long;
  final double? lat;
  final String? fcm;
  final String updated_at;
  final String created_at;

  User({
    required this.name,
    required this.email,
    required this.token,
    required this.id,
    required this.updated_at,
    required this.created_at,
    this.email_verified_at,
    this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.fcm,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        token,
        id,
        updated_at,
        created_at,
        email_verified_at,
        isActive,
        country,
        ip,
        long,
        lat,
        fcm,
      ];
}
