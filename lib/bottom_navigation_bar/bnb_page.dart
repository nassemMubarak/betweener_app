import 'package:betweener_app/bottom_navigation_bar/bloc/bnb/bnb_bloc.dart';
import 'package:betweener_app/core/theme/app_theme_data.dart';
import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BnbPage extends StatelessWidget {
  BnbPage({Key? key}) : super(key: key);
  final List<Widget> body = [
    Text('a'),
    Text('b'),
    const ProfileScreen(),
  ];
  final List<AppBar> appBars = [
    AppBar(),
    AppBar(),
    ProfileScreen.appBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BnbBloc>(
      create: (context) => BnbBloc(),
      child: BlocBuilder<BnbBloc, BnbState>(
        builder: (context, state) {
          if (state is BnbInitial) {
            return Scaffold(
              floatingActionButton: state.pageIndex == 2
                  ? FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32.r,
                      ),
                    )
                  : null,
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 32.h, right: 22.w, left: 22.w),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  child: SizedBox(
                    height: 60.h,
                    child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      backgroundColor: AppThemeData.lightTheme.primaryColor,
                      unselectedItemColor: Colors.white,
                      onTap: (index) {
                        BlocProvider.of<BnbBloc>(context).add(ChangeBnbEvent(index));
                      },
                      currentIndex: state.pageIndex,
                      items: [
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            const AssetImage('images/location.png'),
                            size: 24.r,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            const AssetImage('images/home.png'),
                            size: 24.r,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            const AssetImage('images/profile.png'),
                            size: 24.r,
                          ),
                          label: '',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              appBar: appBars[state.pageIndex],
              body: body[state.pageIndex],
            );
          }
          return const Text('impossible');
        },
      ),
    );
  }
}
