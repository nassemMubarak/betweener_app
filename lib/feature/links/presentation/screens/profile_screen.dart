import 'package:betweener_app/core/widgets/loading_widget.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/links/presentation/bolc/link/link_bloc.dart';
import 'package:betweener_app/feature/links/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/list_links.dart';

class ProfileScreen extends StatelessWidget {
  final bool isUser;
  final User user;

  const ProfileScreen({this.isUser = false, Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserCard(isUser: isUser, user: user),
        Visibility(
          visible: !isUser,
          child: BlocBuilder<LinkBloc, LinkState>(
            builder: (context, state) {
              if (state is LinkLoadingState) {
                return const LoadingWidget();
              } else if (state is LinkErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is LinkSuccessState) {
                return ListOfLinks(
                  links: state.links!,
                  isUser: false,
                );
              } else {
                return const Center(
                  child: Text('Good Morning boys'),
                );
              }
            },
          ),
        ),
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
