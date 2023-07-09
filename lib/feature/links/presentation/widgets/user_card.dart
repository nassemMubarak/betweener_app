import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.h,
      margin: EdgeInsets.symmetric(
        horizontal: 38.w,
        vertical: 30.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 87.w,
                height: 87.h,
                margin: EdgeInsets.only(
                  right: 16.w,
                  left: 22.w,
                  top: 19.h,
                  bottom: 19.h,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('images/dummy_image/person.png'),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  29.height(),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  6.height(),
                  Text(
                    'example@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  6.height(),
                  Text(
                    '+9700000000',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
