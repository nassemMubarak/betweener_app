import 'package:betweener_app/bottom_navigation_bar/bnb_page.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:betweener_app/feature/auth/prssentation/pages/handel_finger_page.dart';
import 'package:betweener_app/feature/auth/prssentation/pages/login_page.dart';
import 'package:betweener_app/feature/auth/prssentation/pages/onboarding_page.dart';
import 'package:betweener_app/home_view .dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './injection_container.dart' as di;
import 'biometric_helper.dart';
import 'core/theme/app_theme_data.dart';
import 'feature/auth/domain/entities/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<AuthBloc>()..add(GetCurrentUserEvent())),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              home: _initialPage(),
              // home: BnbPage(user: User(name: 'name', email: 'email', phone: 'phone', role: 'role', latitude: 'latitude', longitude: 'longitude', isVerifyEmail: true, codeVerifyEmail: 'codeVerifyEmail', token: 'token')),
              theme: AppThemeData.lightTheme,
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }

  Widget _initialPage() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoadedUserState) {
            return HandelFingerPage(user: state.user);

        } else if (state is AuthInitial) {
          return const OnBoardingPage();
        }
        return const OnBoardingPage();
      },
    );
  }
  //
}
