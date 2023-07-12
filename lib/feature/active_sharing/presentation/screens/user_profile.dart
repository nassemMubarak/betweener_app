import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final User user;

  const UserProfile({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileScreen.appBar(titleForUsers: user.name),
      body: ProfileScreen(isUser: true, user: user),
    );
  }
}
