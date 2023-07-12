import 'package:betweener_app/core/extensions/num_extension.dart';
import 'package:betweener_app/core/widgets/loading_widget.dart';
import 'package:betweener_app/feature/active_sharing/presentation/bloc/share/active_sharing_bloc.dart';
import 'package:betweener_app/feature/active_sharing/presentation/widgets/active_sharing_user_card.dart';
import 'package:betweener_app/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveSharing extends StatefulWidget {
  const ActiveSharing({Key? key}) : super(key: key);

  @override
  State<ActiveSharing> createState() => _ActiveSharingState();

  static AppBar appBar() {
    return AppBar(
      title: Text(
        'Active Sharing',
        style: TextStyle(
          color: const Color(0xff2D2B4E),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}

class _ActiveSharingState extends State<ActiveSharing> {
  @override
  void dispose() {
    // TODO: implement dispose
    // BlocProvider.of<ActiveSharingBloc>(context).add(DeleteActive());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActiveSharingBloc>(
      create: (context) => di.sl<ActiveSharingBloc>()..add(GetNearUsers()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.height(),
              Center(
                child: Image.asset(
                  'images/location_big.png',
                  width: 120.w,
                  height: 193.h,
                ),
              ),
              34.height(),
              BlocBuilder<ActiveSharingBloc, ActiveSharingState>(
                builder: (context, state) {
                  if (state is LoadingActiveSharingState) {
                    return const LoadingWidget();
                  } else if (state is SuccessActiveSharingState) {
                    return SizedBox(
                      height: 300.h,
                      child: ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return ActiveSharingUserCard(
                            user: state.users[index],
                          );
                        },
                      ),
                    );
                  } else if (state is ErrorActiveSharingState) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return const Text('hi');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
