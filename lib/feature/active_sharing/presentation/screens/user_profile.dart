import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileScreen.appBar(titleForUsers: 'Ahmed Ali'),
      body: const ProfileScreen(isUser: true),
    );
  }
}
