import 'package:betweener_app/core/util/snackbar_message.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../main_page.dart';
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
        if(state is AuthMessageSuccessState){
          SnackBarMessage().showSnackBarSuccess(message: state.message, context: context);
        }else if(state is AuthMessageErrorState){
          SnackBarMessage().showSnackBarError(message: state.message, context: context);
        }else if(state is AuthLoadedUserState){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const MainPage()), (route) => false);
        }
      },
      builder: (context, state) {
        if(state is AuthLoadingState){
          return LoadingWidget();
        }
        return RegisterFormWidget();
      },
    );
  }
}
