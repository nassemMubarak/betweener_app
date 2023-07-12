import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:betweener_app/feature/links/presentation/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  final bool isUser;
  final User user;

  const UserCard({
    this.isUser = false,
    super.key, required this.user,
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
          // BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          //   if (state is AuthLoadedUserState) {
          //     return Row(
          //       children: [
          //         Container(
          //           width: 87.w,
          //           height: 87.h,
          //           margin: EdgeInsets.only(
          //             right: 16.w,
          //             left: 22.w,
          //             top: 19.h,
          //             bottom: 19.h,
          //           ),
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.white,
          //             image: DecorationImage(
          //               image: AssetImage('images/dummy_image/person.png'),
          //             ),
          //           ),
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             29.height(),
          //             Text(
          //               state.user.name,
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //             6.height(),
          //             Text(
          //               state.user.email,
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 12.sp,
          //               ),
          //             ),
          //             6.height(),
          //             Visibility(
          //               visible: !isUser,
          //               replacement: SizedBox(
          //                 width: 80.w,
          //                 height: 25.h,
          //                 child: ElevatedButton(
          //                   onPressed: () {},
          //                   style: ElevatedButton.styleFrom(
          //                     elevation: 0,
          //                     backgroundColor: const Color(0xFFFFD465),
          //                     minimumSize: Size(double.infinity, 48.h),
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(7.r),
          //                     ),
          //                   ),
          //                   child: Text('Follow',
          //                       style: TextStyle(
          //                         color: Theme.of(context).primaryColor,
          //                         fontSize: 12.sp,
          //                         fontWeight: FontWeight.w600,
          //                       )),
          //                 ),
          //               ),
          //               child: Text(
          //                 '+970595542241',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.w600,
          //                   fontSize: 12.sp,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     );
          //   } else {
          //     return const Text('No User');
          //   }
          // }),
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
                    user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  6.height(),
                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  6.height(),
                  Visibility(
                    visible: !isUser,
                    replacement: SizedBox(
                      width: 80.w,
                      height: 25.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFFFD465),
                          minimumSize: Size(double.infinity, 48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                        ),
                        child: Text('Follow',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    child: Text(
                      '+970595542241',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: !isUser,
            child: Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditProfile();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
