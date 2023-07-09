import 'package:betweener_app/core/extensions/context_extension.dart';
import 'package:betweener_app/core/widgets/loading_widget.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bottom_navigation_bar/bnb_page.dart';
import '../widgets/register_page/register_form_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => BnbPage(user: state.user,)), (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return LoadingWidget();
        }
        return RegisterFormWidget();
      },
    );
  }
}
