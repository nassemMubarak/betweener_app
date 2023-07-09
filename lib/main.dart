import 'package:betweener_app/bottom_navigation_bar/bnb_page.dart';
import 'package:betweener_app/core/theme/app_theme_data.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:betweener_app/feature/auth/prssentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => di.sl<AuthBloc>()..add(GetCurrentUserEvent()))],
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              // home: _initialPage(),
              home: BnbPage(),
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
          return BnbPage();
        } else if (state is AuthInitial) {
          return LoginPage();
        }
        return LoginPage();
      },
    );
  }
}
