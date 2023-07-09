
import 'package:betweener_app/feature/auth/domain/entities/user.dart';

class UserModel extends User{
  UserModel({required super.name, required super.email, required super.phone, required super.role, required super.latitude, required super.longitude, required super.isVerifyEmail, required super.codeVerifyEmail, required super.token});
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isVerifyEmail: json['isVerifyEmail'],
      codeVerifyEmail: json['codeVerifyEmail'],
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'latitude': latitude,
      'longitude': longitude,
      'isVerifyEmail': isVerifyEmail,
      'codeVerifyEmail': codeVerifyEmail,
      'token': token
    };
  }

}