import 'package:betweener_app/core/extensions/context_extension.dart';
import 'package:betweener_app/core/widgets/loading_widget.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:betweener_app/feature/auth/prssentation/widgets/login_page/login_form_widget.dart';
import 'package:betweener_app/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthMessageSuccessState) {
          context.showSnackBarSuccess(message: state.message);
        } else if (state is AuthMessageErrorState) {
          context.showSnackBarError(message: state.message);
        } else if (state is AuthLoadedUserState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainPage()), (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return LoadingWidget();
        }
        return LoginFormWidget();
      },
    );
  }
}
