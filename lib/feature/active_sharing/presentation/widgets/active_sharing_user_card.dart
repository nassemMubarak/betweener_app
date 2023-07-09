import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/feature/active_sharing/presentation/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveSharingUserCard extends StatelessWidget {
  const ActiveSharingUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const UserProfile();
            },
          ));
        },
        child: Card(
          elevation: 0,
          color: const Color(0xffE7E5F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.black, size: 24.h),
                12.width(),
                const Text('ahmed Ali'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
