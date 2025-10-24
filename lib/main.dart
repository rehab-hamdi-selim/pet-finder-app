import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection.dart';
import 'core/routing/app_router.dart';

void main() {
  initGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pet Finder App',
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          onGenerateRoute: AppRouter().onGenerateRoute,
        );
      },
    );
  }
}
