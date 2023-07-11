import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final int id;
  final String token;
  final String updated_at;
  final String created_at;

  User({
    required this.name,
    required this.email,
    required this.token,
    required this.id,
    required this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        updated_at,
        created_at,
        token,
        id,
      ];
}
