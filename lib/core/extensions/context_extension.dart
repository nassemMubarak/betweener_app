import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MyContext on BuildContext {
  void showSnackBarSuccess({required String message}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    ));
  }

  void showSnackBarError({required String message}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ));
  }
  void showSnackBarCopyText({required String message}){
    ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(content: Container(
          width: 50,
          alignment: Alignment.center,
          child: Text(message),
        ),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.teal,
          width: 200,

        )
    );
  }
}
