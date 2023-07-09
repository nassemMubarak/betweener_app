import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(color: Color(0xff2D2B4E), fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}
