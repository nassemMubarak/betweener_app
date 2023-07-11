import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MyDouble on num {
  Widget width() {
    return SizedBox(
      width: w,
    );
  }

  Widget height() {
    return SizedBox(
      height: h,
    );
  }

}
