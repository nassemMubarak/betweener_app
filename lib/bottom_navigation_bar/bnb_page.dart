import 'package:betweener_app/bottom_navigation_bar/bloc/bnb/bnb_bloc.dart';
import 'package:betweener_app/core/theme/app_theme_data.dart';
import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 32, right: 22, left: 22),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  child: SizedBox(
                    height: 60,
                    child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      backgroundColor: AppThemeData.lightTheme.primaryColor,
                      unselectedItemColor: Colors.white,
                      onTap: (index) {
                        BlocProvider.of<BnbBloc>(context).add(ChangeBnbEvent(index));
                      },
                      currentIndex: state.pageIndex,
                      items: const [
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage('images/location.png'),
                            size: 24,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage('images/home.png'),
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage('images/profile.png'),
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
