import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/feature/links/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserCard(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SizedBox(
                            width: 58,
                            height: 58,
                            child: SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: const Color(0xFFFFD465),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          12.width(),
                          SizedBox(
                            width: 58,
                            height: 58,
                            child: SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Container(
                          height: 58.h,
                          padding: EdgeInsets.symmetric(horizontal: 13.w),
                          decoration: BoxDecoration(
                            color: index % 2 == 0 ? const Color(0xffFEE2E7) : const Color(0xffE7E5F1),
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Instagram'),
                              Text('Instagram.com/ba/dssd'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    16.height(),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  static AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(
          color: Color(0xff2D2B4E),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
