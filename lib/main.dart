import 'dart:io';

import 'package:flutter/material.dart';

import 'core/routes/app_routes_config.dart';
import 'core/util/app_constants_string.dart';
import 'core/util/app_theme.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider:  AppRoutes.router.routeInformationProvider,
      routerDelegate: AppRoutes.router.routerDelegate,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      title: AppStringConstant.applicationTitle,
      theme: AppThemes.appTheme,
      darkTheme: AppThemes.appTheme,
    );
  }
}