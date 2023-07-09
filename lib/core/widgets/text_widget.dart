import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const TextWidget({
    super.key, required this.text, this.fontSize, this.fontWeight,  this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        color: color??Colors.black,
        fontSize:fontSize??12.sp,
        fontWeight: fontWeight??FontWeight.w400,
        fontFamily: 'Montserrat'
    ),);
  }
}
