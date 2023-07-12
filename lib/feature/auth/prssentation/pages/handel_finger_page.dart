
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/share/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../biometric_helper.dart';
import '../../../../bottom_navigation_bar/bnb_page.dart';
class HandelFingerPage extends StatefulWidget {
  final User user;
  const HandelFingerPage({Key? key, required this.user}) : super(key: key);

  @override
  State<HandelFingerPage> createState() => _HandelFingerPageState();
}

class _HandelFingerPageState extends State<HandelFingerPage> {
  bool showBiometric = false;
  bool isAuthenticated = false;

  @override
  void initState() {
    isBiometricsAvailable();
    Future.delayed(Duration.zero,()async{
      await finger();
    });
    super.initState();
  }
  Future finger()async{
    isAuthenticated = await BiometricHelper().authenticate();
    if(isAuthenticated){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>BnbPage(user: widget.user)), (route) => false);
    }
  }
  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: ()async{
                await finger();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/finger_image.png'),
              SizedBox(height: 30.h),
              const Text('Enter Finger',style: TextStyle(
                fontSize: 20
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
