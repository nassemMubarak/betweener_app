import 'package:betweener_app/core/widgets/text_widget.dart';
import 'package:betweener_app/feature/share/presentation/pages/scan_page.dart';
import 'package:betweener_app/feature/share/presentation/widgets/home_page/container_in_home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  // final User user;
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextWidget(text: 'Hello, ${user.name}',color: Color(0xFF2D2B4E),fontWeight: FontWeight.w600,fontSize: 20.sp,),
            TextWidget(
              text: 'Hello, Ahmed!',
              color: Color(0xFF2D2B4E),
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
            SizedBox(height: 16.h),
            Center(child: Image.asset('images/scan_image.png', width: 290.w, height: 300.h)),
            SizedBox(height: 40.h),
            Divider(
              height: 2,
              thickness: 2,
              endIndent: 81.w,
              indent: 81.w,
              color: Colors.black,
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    const ContainerInHomePageWidget(title: 'FACEBOOK', subTitle: '@oalshokri'),
                    ContainerInHomePageWidget(title: 'INSTAGRAM', subTitle: '@oalshokri', margin: 24.w),
                    ContainerInHomePageWidget(subTitle: 'Add More', margin: 24.w),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ScanPage()));
              },
              icon: Icon(Icons.qr_code_scanner_rounded));
        }),
      ],
      actionsIconTheme: IconThemeData(color: Colors.black),
    );
  }
}
