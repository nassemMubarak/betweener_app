import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/feature/active_sharing/presentation/widgets/active_sharing_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveSharing extends StatelessWidget {
  const ActiveSharing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.height(),
            Center(
              child: Image.asset(
                'images/location_big.png',
                width: 120.w,
                height: 193.h,
              ),
            ),
            34.height(),
            const ActiveSharingUserCard(),
            const ActiveSharingUserCard(),
            const ActiveSharingUserCard(),
            const ActiveSharingUserCard(),
          ],
        ),
      ),
    );
  }

  static AppBar appBar() {
    return AppBar(
      title: Text(
        'Active Sharing',
        style: TextStyle(
          color: const Color(0xff2D2B4E),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}
