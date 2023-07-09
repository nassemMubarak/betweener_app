import 'package:betweener_app/feature/links/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../widgets/list_links.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UserCard(),
        ListOfLinks(),
      ],
    );
  }

  static AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(
          color: Color(0xff2D2B4E),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
