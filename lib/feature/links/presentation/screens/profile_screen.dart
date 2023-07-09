import 'package:betweener_app/feature/links/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../widgets/list_links.dart';

class ProfileScreen extends StatelessWidget {
  final bool isUser;
  const ProfileScreen({this.isUser = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserCard(isUser: isUser),
        ListOfLinks(isUser: isUser),
      ],
    );
  }

  static AppBar appBar({String? titleForUsers}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        titleForUsers ?? 'Profile',
        style: const TextStyle(
          color: Color(0xff2D2B4E),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
