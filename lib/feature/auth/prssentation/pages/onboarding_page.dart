import 'package:betweener_app/core/widgets/elevation_button_widget.dart';
import 'package:betweener_app/feature/auth/prssentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
  Widget _buildBody(BuildContext context){
    return Padding(padding: EdgeInsets.only(left: 34.w,right: 34.w,top: 198.h),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset('images/onboarding_image.png',width: 251.w,height: 254.h),
            SizedBox(height: 163.h),
             ElevatedButtonWidget(text: 'Get Started',onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
             },)
          ],
        ),
    ),
    );
  }
}
