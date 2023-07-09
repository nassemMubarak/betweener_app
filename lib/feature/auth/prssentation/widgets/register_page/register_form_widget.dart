import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/elevation_button_widget.dart';
import '../../../../../core/widgets/text_widget.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../text_form_field_and_label_widget.dart';
import '../validate_inputs_auth.dart';
class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showOrHidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 25.h),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                Center(child: Image.asset('images/login_image.png',width: 154.w,height: 92.h,)),
                SizedBox(height: 40.h),
                TextFormFieldAndLabelWidget(controller: _nameController, label: 'Name', hintText: 'betweener', prefixIcon:Icon(Icons.person) , textInputType: TextInputType.text, validate: validateName),
                SizedBox(height: 16.h),
                TextFormFieldAndLabelWidget(controller: _emailController, label: 'Email', hintText: 'betweener@gmail.com', prefixIcon:Icon(Icons.email) , textInputType: TextInputType.emailAddress, validate: validateEmail),
                SizedBox(height: 16.h),
                TextFormFieldAndLabelWidget(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: '*******',
                  passwordHide: showOrHidePassword,
                  prefixIcon: Icon(Icons.lock),
                  textInputType: TextInputType.text,
                  validate: validatePassword,
                  suffixIcon: hideAndShowPassword(),
                ),
                SizedBox(height: 25.h),
                ElevatedButtonWidget(text: 'REGISTER',textColor: Color(0xFF784E00),onPressed: validationInputs),
                SizedBox(height: 26.h),
                TextWidget(text: '-    or    -',fontSize: 16.sp,fontWeight: FontWeight.w500),
                SizedBox(height: 19.h),
                ElevatedButtonWidget(text: 'SIGN IN WITH GOOGLE',prefixIcon: Image.asset('images/google_logo.png',width: 24.w,height: 24.h,),colorStroke: Color(0xFFA90606),textColor: Color(0xFF784E00),buttonColor: Colors.transparent,),

              ],
            ),
          ),
        ));
  }
  Widget hideAndShowPassword() {
    return IconButton(
      icon: Icon(showOrHidePassword ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          showOrHidePassword = !showOrHidePassword;
        });
      },
      color: const Color(0xFF747474),
      splashColor: Colors.transparent,
    );
  }
  validationInputs(){
    final Map authData = {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "phone": '+970${generateRandomNumber()}',
      "role":  'user',
      "latitude": '65666564',
      "longitude": '5454545'
    };
    final validte = _formKey.currentState!.validate();
    if(validte){
      BlocProvider.of<AuthBloc>(context)
          .add(RegisterUserEvent(authData: authData));
    }
  }
  String generateRandomNumber() {
    Random random = Random();
    String randomNumber = '';

    for (int i = 0; i < 9; i++) {
      randomNumber += random.nextInt(10).toString();
    }

    return randomNumber;
  }
}
