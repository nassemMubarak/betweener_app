import 'dart:convert';

import 'package:betweener_app/core/extensions/context_extension.dart';
import 'package:betweener_app/core/widgets/loading_widget.dart';
import 'package:betweener_app/core/widgets/text_widget.dart';
import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/feature/links/presentation/bolc/link/link_bloc.dart';
import 'package:betweener_app/feature/links/presentation/screens/add_link.dart';
import 'package:betweener_app/feature/share/presentation/pages/scan_page.dart';
import 'package:betweener_app/feature/share/presentation/widgets/home_page/container_in_home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../auth/domain/entities/user.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
        name: user.name,
        email: user.email,
        token: user.token,
        id: user.id,
        updated_at: user.updated_at,
        created_at: user.created_at);
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'hello, ${user.name}',
              color: Color(0xFF2D2B4E),
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: 'https://betweener.page.link/Zi7X'));
                context.showSnackBarCopyText(message: 'تم نسخ الرابط بنجاح');
              },
              child: Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.center,
                child: QrImageView(data: json.encode(userModel.toJson())),
              ),
            ),
            SizedBox(height: 10.h),
            Divider(
              height: 2,
              thickness: 2,
              endIndent: 81.w,
              indent: 81.w,
              color: Colors.black,
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: BlocBuilder<LinkBloc, LinkState>(
                  builder: (context, state) {
                    if (state is LinkSuccessState) {
                      return Container(
                        height: 85.h,
                        width: 1.sw,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.links!.length + 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            print(index);
                            if (index < state.links!.length) {
                              return ContainerInHomePageWidget(
                                title: state.links![index].title,
                                subTitle: state.links![index].link,
                                margin: 10,
                                onTap: (){
                                  Clipboard.setData(
                                      ClipboardData(text: state.links![index].link));
                                  context.showSnackBarCopyText(message: 'تم نسخ الرابط بنجاح');
                                },
                              );
                            } else {
                              return ContainerInHomePageWidget(
                                subTitle: 'Add More',
                                margin: 10.w,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AddLink(
                                              username: userModel.name)));
                                },
                              );
                            }
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

/*
Row(
                  children: [
                    const ContainerInHomePageWidget(
                        title: 'FACEBOOK', subTitle: '@oalshokri'),
                    ContainerInHomePageWidget(
                        title: 'INSTAGRAM',
                        subTitle: '@oalshokri',
                        margin: 24.w),
                    ContainerInHomePageWidget(
                        subTitle: 'Add More', margin: 24.w),
                  ],
                )
 */
  static AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ScanPage()));
              },
              icon: Icon(Icons.qr_code_scanner_rounded));
        }),
      ],
      actionsIconTheme: IconThemeData(color: Colors.black),
    );
  }
}
