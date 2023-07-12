import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileScreen.appBar(titleForUsers: 'Ahmed Ali'),
      body:  BlocBuilder<AuthBloc,AuthState>(
        builder: (context, state) {
          if(state is AuthLoadedUserState){
            return ProfileScreen(isUser: true,user: state.user);
          }
          return Container();
        },
      ),
    );
  }
}
