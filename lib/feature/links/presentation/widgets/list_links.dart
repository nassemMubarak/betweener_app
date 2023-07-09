import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/feature/links/presentation/screens/edit_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListOfLinks extends StatelessWidget {
  final bool isUser;

  const ListOfLinks({
    this.isUser = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Slidable(
                  endActionPane: isUser
                      ? null
                      : ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SizedBox(
                              width: 58,
                              height: 58,
                              child: SlidableAction(
                                onPressed: (context) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditLink(),
                                  ));
                                },
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
                        children: [
                          Text(
                            'Instagram'.toUpperCase(),
                            style: TextStyle(
                              letterSpacing: 2.8,
                              fontSize: 14.sp,
                              color: index % 2 == 0 ? const Color(0xff783341) : const Color(0xff2D2B4E),
                            ),
                          ),
                          Text(
                            'Instagram.com/ba/dssd',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: index % 2 == 0 ? const Color(0xff9B6A73) : const Color(0xff807D99),
                            ),
                          ),
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
    );
  }
}
