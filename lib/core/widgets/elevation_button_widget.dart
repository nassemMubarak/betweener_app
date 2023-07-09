import 'package:betweener_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ElevatedButtonWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final String text;
  final Function()? onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final Color? colorStroke;
  const ElevatedButtonWidget({
    super.key, required this.text, this.onPressed, this.textColor, this.buttonColor, this.prefixIcon, this.colorStroke,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed??() {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
          backgroundColor: buttonColor??Color(0xFFFFD465),
          minimumSize: Size(double.infinity, 48.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color:colorStroke??(buttonColor!=null?Color(0xFF2D2B4E):Colors.transparent),
              width: buttonColor!=null?2:0
            )
          )
      ),
      child: prefixIcon==null?TextWidget(
        text: text,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: textColor??Colors.white,
      ):Row(
        children: [
          prefixIcon!,
          SizedBox(width: 25.w),
          TextWidget(
            text: text,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: textColor??Colors.white,
          )
        ],
      ),
    );
  }
}
