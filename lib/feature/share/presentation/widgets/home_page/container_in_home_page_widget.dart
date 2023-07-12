import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/text_widget.dart';
class ContainerInHomePageWidget extends StatelessWidget {
  final String? title;
  final String subTitle;
  final double? margin;
  final Function()? onTap;
  const ContainerInHomePageWidget({
    super.key,  this.title, required this.subTitle, this.margin, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(start: margin??5.w),
        width: 116.w,
        height: 85.h,
        decoration: BoxDecoration(
          color: title==null?Color(0xFFE7E5F1):Color(0xFFFFE6A6),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title==null?
                Icon(Icons.add,color: Color(0xFF2D2B4E),size: 32.w)
                :TextWidget(text: title!,color: Color(0xFF784E00),fontSize: 16.sp,fontWeight: FontWeight.w600),
            SizedBox(height: 8.h),
            Center(child: TextWidget(text: subTitle,color: title==null?Color(0xFF2D2B4E):Color(0xFF784E00),fontSize: title==null?16.sp:10.sp)),
          ],
        ),
      ),
    );
  }
}
