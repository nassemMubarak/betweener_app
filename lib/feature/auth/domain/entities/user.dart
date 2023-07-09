import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String role;
  final String latitude;
  final String longitude;
  final bool isVerifyEmail;
  final String codeVerifyEmail;
  final String token;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.latitude,
    required this.longitude,
    required this.isVerifyEmail,
    required this.codeVerifyEmail,
    required this.token,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        role,
        latitude,
        longitude,
        isVerifyEmail,
        codeVerifyEmail,
        token,
      ];
}
