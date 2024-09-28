import 'package:exo_planets/core/routes/app_router.dart';
import 'package:exo_planets/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExoPlanetsApp extends StatelessWidget {
  const ExoPlanetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: "Lato",
        ),
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        title: "Exo Planets",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
