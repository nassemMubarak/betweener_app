import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldAndLabelWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final bool? passwordHide;
  final String? Function(String?)? validate;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;

  const TextFormFieldAndLabelWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textInputType,
    this.passwordHide,
    this.focusNode,
    this.onSubmitted,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16.sp, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          focusNode: focusNode,
          onFieldSubmitted: onSubmitted,
          keyboardType: textInputType,
          controller: controller,
          obscureText: passwordHide ?? false,
          obscuringCharacter: '*',
          validator: (val) => validate!(val),
          decoration: InputDecoration(
            hintText: hintText,
            helperStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12.sp),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconColor: const Color(0xFF747474),
            // fillColor: const Color(0XFFF0F0F0),
            // filled: true,
          ),
        ),
      ],
    );
  }
}
