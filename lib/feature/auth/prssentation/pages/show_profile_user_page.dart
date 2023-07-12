import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:betweener_app/feature/links/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
class ShowProfileUserPage extends StatefulWidget {
  final User user;
  const ShowProfileUserPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ShowProfileUserPage> createState() => _ShowProfileUserPageState();
}

class _ShowProfileUserPageState extends State<ShowProfileUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileScreen.appBar(),
      body: Center(child: UserCard( user: widget.user)),
    );
  }
}
